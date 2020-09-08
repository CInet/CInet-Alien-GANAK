=encoding utf8

=head1 NAME

CInet::Alien::GANAK - The probabilistic model counter GANAK

=cut

# ABSTRACT: The probabilistic model counter GANAK
package CInet::Alien::GANAK;
use base qw(Alien::Base);

=head1 SYNOPSIS

    use IPC::Run3;
    use CInet::Alien::GANAK qw(ganak);

    # Run #SAT solver on a DIMACS CNF file
    run3 [ganak, $cnf_file], \undef, \my $out, \undef;

    # Clauses produced programmatically can be sent to stdin
    run3 [ganak], \&produce_clauses, \my $out, \undef;

    # In any case, parse the answer from $out.
    # CAUTION: it may overflow Perl's native integer,
    # consider C<use bignum>.
    my ($count,) = $out =~ /^s mc (\d+)/;

=head2 VERSION

This document describes CInet::Alien::GANAK v1.0.0.

=cut

our $VERSION = "v1.0.0";

=head1 DESCRIPTION

This module builds a custom version of the probabilistic exact model
counter GANAK developed by Meel and collaborators. It takes a Boolean
formula in conjunctive normal form (in the DIMACS CNF format) and
produces the I<number> of satisfying assignments to it. It is correct
with a certain, adjustable probability. It may fail to terminate with
a conclusive answer as well.

The package C<CInet::Alien::GANAK> is an L<Alien::Base> with one
additional method:

=head2 exe

    my $program = CInet::Alien::GANAK->exe;

Returns the absolute path of the C<ganak> executable bundled with
this module.

=head1 EXPORTS

There is one optional export:

=head2 ganak

    use CInet::Alien::GANAK qw(ganak);
    my $program = ganak;

Returns the same path as C<exe> but is shorter to type.

=cut

use Path::Tiny;

our @EXPORT_OK = qw(ganak);
use Exporter qw(import);

sub exe {
    my $self = shift;
    path($self->dist_dir, 'bin', $self->runtime_prop->{exename});
}

sub ganak {
    __PACKAGE__->exe
}

=head1 SEE ALSO

=over

=item *

The original paper about GANAK is
L<https://www.comp.nus.edu.sg/~meel/Papers/ijcai19srsm.pdf>.

=item *

The original source code for C<ganak> is on github:
L<https://github.com/meelgroup/ganak>.

=item *

The source code repository of the fork bundled with this module is
L<https://github.com/taboege/ganak>.

=back

=head1 AUTHOR

Tobias Boege <tobs@taboege.de>

=head1 COPYRIGHT AND LICENSE

This software is copyright (C) 2020 by Tobias Boege.

This is free software; you can redistribute it and/or
modify it under the terms of the Artistic License 2.0.

=cut

":wq"
