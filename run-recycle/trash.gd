extends Area2D

# 1. Define the enum options
enum trashType { apple, banana, mug, bottle, drink} 

# 2. Export a variable using the enum type
@export var trash = trashType.apple
@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	if trash == trashType.apple:
		sprite_2d.texture = load("res://Assests/apple_trash -1.png.png")
	elif trash == trashType.banana:
		sprite_2d.texture = load("res://Assests/Banana_trash -1.png.png")
	elif trash == trashType.mug:
		sprite_2d.texture = load("res://Assests/Broken mug-1.png.png")
	elif trash == trashType.bottle:
		sprite_2d.texture = load("res://Assests/Plastic_bottle -1.png.png")
	elif trash == trashType.drink:
		sprite_2d.texture = load("res://Assests/Used drink bottle -1.png.png")
		

		
