extends KinematicBody2D

export var max_speed = 48
export var min_speed = 16
export var acceleration = 4
var speed = min_speed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_key_pressed(KEY_Q):
		speed += acceleration
		speed = clamp(speed,min_speed,max_speed)
	else:
		speed -= acceleration
		speed = clamp(speed,min_speed,max_speed)
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	var collision = self.move_and_collide(velocity * delta)
	if collision:
		print_debug("collision")
