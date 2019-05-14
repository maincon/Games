package;

import flixel.*;


class SteeringState extends FlxState{
     
    var _boid:Boid;

    override public function create():Void{
        _boid = new Boid();
        add(_boid);
        super.create();
    }

    override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}