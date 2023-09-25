#!/usr/local/bin/perl
use strict;
use warnings;
use PDF::Report;

my $Data="1";
my $Data_1="2";
my $Data_2="3";
my $Data_3="4";
my $Data_4="5";



my $pdf = new PDF::Report(PageSize => 'A4',PageOrientation => "Portrait");
#***************595*842****************
$pdf->newpage(1);
my $page = $pdf->openpage(1);
#*************Borders**************************************
# Top left corner is ($x1, $y1) and the boData_3om right corner is ($x2, $y2)
my $bx1=20;my $bx2=575;my $by2=822;my $by1=$bx1;
my $img_x=420;my $img_y=780;my $img_scale=0.1; # Logo dimension
my $img_x2=50;my $img_y2=770;my $img_scale2=0.3; # Logo dimension



my $size1=12;my $size2=10;
my $x1=100; my $x2=255; my $y1=600; my $y2=624;
my $x22=495;
my $w=$y2-$y1; # height of cell
my $p1=7; # padding
my $m1=16;
my $h1=40; my $h2=100;
my $font="Times New Roman";



$pdf->drawLine($bx1, $by1, $bx2, $by1);
$pdf->drawLine($bx1, $by1, $bx1, $by2);
$pdf->drawLine($bx1, $by2, $bx2, $by2);
$pdf->drawLine($bx2, $by2, $bx2, $by1);


$pdf->setSize($size1);
# $pdf->setFont($font);
# $pdf->shadeRect($x1, $y1, $x2, $y2, "#2E75B6");
$pdf->drawRect($x1, $y1, $x2, $y2,);
$pdf->addRawText("KEY", $x1 + $h1, $y2-$m1, "black");

# $pdf->shadeRect($x2, $y1, $x22, $y2, "#2E75B6");
$pdf->drawRect($x2, $y1, $x22, $y2);
$pdf->addRawText("VALUE", $x2 + $h2, $y2-$m1, "black");


my $color = 'black';
$pdf->setSize($size2);
$pdf->drawRect($x1, $y1-($w), $x2, $y1);
$pdf->addRawText("Data", $x1 + $p1, $y1-$m1, $color);
$pdf->drawRect($x2, $y1-($w), $x22, $y1);
$pdf->addRawText($Data, $x2 + $p1 , $y1-$m1, $color);
$pdf->drawRect($x1, $y1-(2*$w), $x2, $y1-($w));
$pdf->addRawText("Data_1", $x1 + $p1, $y1-$m1-$w, $color);
$pdf->drawRect($x2, $y1-(2*$w), $x22, $y1-($w));
$pdf->addRawText($Data_1, $x2 + $p1 , $y1-$m1-$w, $color);



print($pdf->getStringWidth($Data_2));



if($pdf->getStringWidth($Data_2) < 200){
$pdf->drawRect($x1, $y1-(3*$w), $x2,$y1-(2*$w));
$pdf->addParagraph("Data_2" ,$x1 + $p1,$y1-$m1-(2*$w), 180, 40, 0, 25);
$pdf->drawRect($x2, $y1-(3*$w), $x22, $y1-(2*$w));
$pdf->addRawText($Data_2,$x2 + $p1,$y1-$m1-(2*$w),$color );
}
else{
print("out of len");
$pdf->drawRect($x1, $y1-(3*$w) , $x2,$y1-(2*$w));
$pdf->addRawText("Data_2", $x1 + $p1, $y1-$m1-(2*$w), $color);
# print()
# $pdf->addRawText($newtext,$x2 + $p1,$y1-$m1-(2*$w),$color );
$pdf->drawRect($x2, $y1-(3*$w), $x22, $y1-(2*$w));
my $newtext = $pdf->wrapText($Data_2,200);
$pdf->setAddTextPos($x2 - (3.2*$p1) , $y1-$m1-(2*$w)+6);
$pdf->addText($newtext, $x2 - (3.2*$p1) ,300, 50); #xcoordinat ,
}
$pdf->drawRect($x1, $y1-(4*$w), $x2,$y1-(3*$w));
$pdf->addRawText("Data_3", $x1 + $p1, $y1-$m1-(3*$w), $color);
$pdf->drawRect($x2, $y1-(4*$w), $x22,$y1-(3*$w));
$pdf->addRawText($Data_3, $x2 + $p1 , $y1-$m1-(3*$w), $color);
$pdf->drawRect($x1, $y1-(5*$w), $x2, $y1-(4*$w));
$pdf->addRawText("Data_4 ", $x1 + $p1, $y1-$m1-(3.8*$w), $color);



$pdf->drawRect($x2, $y1-(5*$w), $x22, $y1-(4*$w));
$pdf->addRawText($Data_4, $x2 + $p1 , $y1-$m1-(4*$w), $color);

$pdf->saveAs("Sample_1.pdf");