package;

import flixel.*;
import flixel.math.*;

class Boid extends FlxSprite{
    public function new(){
        super(FlxG.width / 2, FlxG.height / 2);

        velocity.x = 10;
        velocity.y = 10;

        
    }
    //segue o ponto
    public function seek(x:Int, y:Int):FlxVector{
        var target = new FlxVector(x, y);
        var seek = target.subtractPoint(
            new FlxVector(this.x, this.y)
        );
        seek.normalize().scale(20);
        return seek;
    }

    //escapa do ponto
    public function flee(x:Int, y:Int):FlxVector{
        return seek(x, y).scale(-0.5);
    }

    public function arrive(x:Int, y:Int, raio:Float):FlxVector{
    	var target = new FlxVector(x, y);
    	var direto = target.subtractPoint(
    		new FlxVector(this.x, this.y)
    	);

    	if(direto.length <= raio){
    		return new FlxVector(velocity.x, velocity.y);
    			.normalize()
    			.scale(-20);
    	}else{
    		return new FlxVector();
    	}
    	return null;
    }


    override public function update(elapsed:Float):Void{
        super.update(elapsed);

        var steering = new FlxVector(0, 0);
        //steering.addPoint(flee(FlxG.mouse.x, FlxG.mouse.y));
        //steering.addPoint(seek(FlxG.width, FlxG.height));
        steering.addPoint(arrive(FlxG.mouse.x, FlxG.mouse.y, 50));
        steering.addPoint(seek(FlxG.mouse.x, FlxG.mouse.y));
        acceleration.x = steering.x;
        acceleration.y = steering.y;
    }
}