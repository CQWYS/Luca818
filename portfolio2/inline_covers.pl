#!/usr/bin/perl
use strict;
use warnings;

my $base_dir = "C:/Users/112/.qoderwork/workspace/mppnogidw8u2yx2l/outputs/portfolio2";

# Read replacements
open my $fh, '<', "$base_dir/covers_base64.txt" or die $!;
my %replacements;
while (<$fh>) {
    chomp;
    next unless /^REPLACE:(.+?):(.+?):(.+)$/;
    my ($path, $mime, $b64) = ($1, $2, $3);
    $replacements{$path} = "data:$mime;base64,$b64";
}
close $fh;

# Read index.html
open my $in, '<', "$base_dir/index.html" or die $!;
my $content = do { local $/; <$in> };
close $in;

# Apply replacements
for my $path (keys %replacements) {
    my $dataUri = $replacements{$path};
    my $escapedPath = quotemeta($path);
    $content =~ s/cover:\s*"$escapedPath"/cover: "$dataUri"/g;
}

# Write back
open my $out, '>', "$base_dir/index.html" or die $!;
print $out $content;
close $out;

print "Done. Replaced " . scalar(keys %replacements) . " cover images.\n";
