// パラメーター
// 直径:単位mm
diameter=40;
// 外周の歯の数: 直径に合わせて調整してください。
number_Of_teeth=48;

//-------------------------------------------------

// キャップ本体の描画
height = 14; // 高さは15mmで固定
eps = 0.01;  // チラつき防止

union() {
    difference() {
        // 外側
        cylinder(h = height, d = diameter, center = false , $fn=100);
        // 内側
        translate([0, 0, -eps ])
            cylinder(h = height+eps , d = 15.1 * 2, center = false, $fn=100);
    }

    // 外周の描画
    for ( i = [0 : number_Of_teeth - 1] )
    {
        rotate( i * 360 / number_Of_teeth, [0, 0, 1])
            translate([0, diameter / 2 * 0.92, 0])
                cylinder(h = height, d=4, center = false , $fn=100);
    }

    // 蓋
    translate([0, 0, height])
        linear_extrude(height = 3, center = false, scale=0.9, $fn = 100)
            circle(diameter / 2, $fn=100);
}
