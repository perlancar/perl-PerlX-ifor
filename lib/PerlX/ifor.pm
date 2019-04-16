## no critic: ()

package PerlX::ifor;

# DATE
# VERSION

use strict;
use warnings;

use Exporter qw(import);
our @EXPORT = qw(ifor);

sub ifor(&$) {
    my ($code, $iterator) = @_;

    if (ref $iterator eq 'CODE') {
        local $_;
        while (defined($_ = $iterator->())) {
            $code->();
        }
    } else {
        die "Only coderef iterator is supported at the moment";
    }
}

1;
# ABSTRACT: A version of for() that accepts iterator instead of list

=for Pod::Coverage .+

=head1 SYNOPSIS

With L<Array::Iter> or L<Range::Iter> which generates a coderef iterator:

 use PerlX::ifor;
 use Array::Iter qw(array_iter list_iter);
 use Range::Iter qw(range_iter);

 ifor { say } iter_range("a", "z");


=head1 DESCRIPTION

CAVEAT: Yes, it's ugly and doesn't look like a regular for(). Sue Perl :-)

TODO: Support other iterator, e.g. L<Array::Iterator>.


=head1 SEE ALSO

=cut
