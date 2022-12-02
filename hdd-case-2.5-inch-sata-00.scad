//material: TPU (flexible)

hdd_height      = 7;
hdd_width       = 70;
hdd_length      = 100;
wall_thickness  = 5;
$fn=16;

module box()
{
    difference()
    {
        cube([hdd_length + wall_thickness, hdd_width + 2 * wall_thickness, hdd_height + 2 * wall_thickness], center=true);
        translate([wall_thickness / 1.75, 0, 0])
        {
            cube([hdd_length, hdd_width, hdd_height], center=true);
        }
    }
}

module groove_lon(pos)
{
    translate(pos)
    {
        rotate([0, 90, 0])
        {
            cylinder(hdd_length * 2, wall_thickness / 2.5, wall_thickness / 2.5, center = true);
        }
    }
}

module groove_lat(pos)
{
    translate(pos)
    {
        rotate([90, 0, 0])
        {
            cylinder(hdd_width * 2, wall_thickness / 2.5, wall_thickness / 2.5, center = true);
        }
    }
}

module hdd_case_v_0()
{
    difference()
    {
        box();
        for(y=[-hdd_width:wall_thickness:hdd_width])
        {
            groove_lon([0, y, hdd_height / 2 + wall_thickness]);
            groove_lon([0, y, -hdd_height / 2 - wall_thickness]);
        }
        groove_lon([0, hdd_width / 2 + wall_thickness, -wall_thickness / 2]);
        groove_lon([0, hdd_width / 2 + wall_thickness, wall_thickness / 2]);
        
        groove_lon([0, -hdd_width / 2 - wall_thickness, -wall_thickness / 2]);
        groove_lon([0, -hdd_width / 2 - wall_thickness, wall_thickness / 2]);

        groove_lat([-hdd_length / 2 - wall_thickness / 2, 0, -wall_thickness / 2]);
        groove_lat([-hdd_length / 2 - wall_thickness / 2, 0, wall_thickness / 2]);

    }
}

hdd_case_v_0();
