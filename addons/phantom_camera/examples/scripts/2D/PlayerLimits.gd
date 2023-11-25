extends Sprite2D

@export var velocity = 200;
var flip=false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_A) or Input.is_action_pressed("ui_left"): 
		self.position.x -= delta * velocity
		self.flip=true
	if Input.is_key_pressed(KEY_D) or Input.is_action_pressed("ui_right"):
		self.position.x += delta * velocity
		self.flip=false
	if Input.is_key_pressed(KEY_W) or Input.is_action_pressed("ui_up"):
		self.position.y -= delta * velocity
	if Input.is_key_pressed(KEY_S) or Input.is_action_pressed("ui_down"):
		self.position.y += delta * velocity
	if Input.is_key_pressed(KEY_1):
		(%"PlayerPhantomCamera2D-Free" as PhantomCamera2D).set_priority(1)
		(%"PlayerPhantomCamera2D-Limits" as PhantomCamera2D).set_priority(2)
	if Input.is_key_pressed(KEY_2):
		(%"PlayerPhantomCamera2D-Free" as PhantomCamera2D).set_priority(2)
		(%"PlayerPhantomCamera2D-Limits" as PhantomCamera2D).set_priority(1)

	if( (flip && self.scale.x>0) or (!flip && self.scale.x<0)):
		self.scale.x *= -1
