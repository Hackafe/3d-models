d_coin = 22.5; // coin diameter, 22.5 for pound, 23.8 for euro
t_coin = 1.75; // coin thickness, 3.15 for pound, 2 for euro
d_hole = 5; // hole diameter
l_tail = 27; // distance from coin center to hole center
$fn = 200; // render quality
text="50";
font="Liberation Sans";
fontsize=9;

// put it all together
difference()
{
    coinToken();
    embossedText();
}

// functions
module coinToken()
{
    difference()
    {
        // coin
        cylinder(h=t_coin, d=d_coin);

        // cutout
        translate([0, -9, 0])
            scale([1, 0.4, 1])
                cylinder(h=t_coin+1, d=30);

    }

    difference()
    {
        // tail
        hull()
        {
            cylinder(h=t_coin, d=5);
            translate([0, -l_tail, 0])
                cylinder(h=t_coin, d=12);
        }

        // hole
        translate([0, -l_tail, 0])
            cylinder(h=t_coin+1, d=d_hole);
    }
}

module embossedText()
{
    translate([0,3,0])
        rotate([0,0,0])
            linear_extrude(height=t_coin)
                text(text=text, font=font, halign="center", valign="center", size=fontsize);
}
