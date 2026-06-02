#!/usr/bin/perl
use strict;
use warnings;

my $file = "C:/Users/112/.qoderwork/workspace/mppnogidw8u2yx2l/outputs/portfolio2/index.html";
open my $fh, '<', $file or die $!;
my $content = do { local $/; <$fh> };
close $fh;

# Background colors
$content =~ s/background: #050505;/background: #ffffff;/g;
$content =~ s/background: #050505\b/background: #ffffff/g;
$content =~ s/background: rgba\(5,5,5,0\.96\)/background: rgba(255,255,255,0.96)/g;
$content =~ s/background: rgba\(5,5,5,0\.98\)/background: rgba(255,255,255,0.98)/g;
$content =~ s/background: rgba\(0,0,0,0\.92\)/background: rgba(255,255,255,0.92)/g;

# Body text
$content =~ s/color: #e8e8e8;/color: #333333;/g;

# Solid white to black
$content =~ s/color: #ffffff;/color: #000000;/g;
$content =~ s/color: #fff;/color: #000;/g;
$content =~ s/border-color: #fff;/border-color: #000;/g;
$content =~ s/color: #fff;/color: #000;/g;

# Mid grays
$content =~ s/color: #bbb;/color: #555;/g;
$content =~ s/color: #aaa;/color: #555;/g;
$content =~ s/color: #999;/color: #555;/g;

# rgba white → black (careful ordering)
$content =~ s/rgba\(255,255,255,0\.98\)/rgba(0,0,0,0.98)/g;
$content =~ s/rgba\(255,255,255,0\.06\)/rgba(0,0,0,0.06)/g;
$content =~ s/rgba\(255,255,255,0\.04\)/rgba(0,0,0,0.04)/g;
$content =~ s/rgba\(255,255,255,0\.3\)/rgba(0,0,0,0.3)/g;
$content =~ s/rgba\(255,255,255,0\.25\)/rgba(0,0,0,0.25)/g;
$content =~ s/rgba\(255,255,255,0\.18\)/rgba(0,0,0,0.18)/g;
$content =~ s/rgba\(255,255,255,0\.05\)/rgba(0,0,0,0.05)/g;
$content =~ s/rgba\(255,255,255,0\.4\)/rgba(0,0,0,0.4)/g;
$content =~ s/rgba\(255,255,255,0\.08\)/rgba(0,0,0,0.08)/g;
$content =~ s/rgba\(255,255,255,0\.35\)/rgba(0,0,0,0.35)/g;
$content =~ s/rgba\(255,255,255,0\.45\)/rgba(0,0,0,0.45)/g;
$content =~ s/rgba\(255,255,255,0\.03\)/rgba(0,0,0,0.03)/g;
$content =~ s/rgba\(255,255,255,0\.12\)/rgba(0,0,0,0.12)/g;
$content =~ s/rgba\(255,255,255,0\.15\)/rgba(0,0,0,0.15)/g;
$content =~ s/rgba\(255,255,255,0\.1\)/rgba(0,0,0,0.1)/g;
$content =~ s/rgba\(255,255,255,0\.5\)/rgba(0,0,0,0.5)/g;
$content =~ s/rgba\(255,255,255,0\.92\)/rgba(0,0,0,0.92)/g;

# Error display
$content =~ s/background:rgba\(30,30,30,0\.96\)/background:rgba(240,240,240,0.96)/g;
$content =~ s/color:#fff;/color:#000;/g;
$content =~ s/box-shadow:0 8px 40px rgba\(255,255,255,0\.15\)/box-shadow:0 8px 40px rgba(0,0,0,0.15)/g;

# Loading ring
$content =~ s/border: 1\.5px solid rgba\(0,0,0,0\.06\);\n    border-top-color: #000000;/border: 1.5px solid rgba(0,0,0,0.06);\n    border-top-color: #000000;/g;

# Lightbox keep dark? No, user wants white theme overall, but lightbox could stay dark for contrast.
# Actually let's keep lightbox dark since it's a media viewer. But the user said "background white"
# Let's convert lightbox to white too for consistency, or leave it. I'll leave it dark for now
# since media viewers usually benefit from dark backgrounds.

open my $out, '>', $file or die $!;
print $out $content;
close $out;
print "White theme CSS applied.\n";
