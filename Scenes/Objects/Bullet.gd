extends KinematicBody2D

var velocity = Vector2.ZERO
var direction = Vector2(0,-1)
var speed = 200

export var damage = 1

func _ready():
	set_as_toplevel(true)
	global_position = get_parent().get_node("BulletSpawner").global_position
	rotation_degrees = get_parent().rotation_degrees
	speed = get_parent().bullet_speed
	velocity = direction.rotated(deg2rad(rotation_degrees))

func _physics_process(delta):
	move_and_slide(velocity * speed)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()