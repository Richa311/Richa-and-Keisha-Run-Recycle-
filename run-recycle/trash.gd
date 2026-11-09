extends Area2D

# 1. Define the enum options
enum trashType { apple, banana, mug, bottle, drink} 

# 2. Export a variable using the enum type
@export var trash = trashType.apple
@onready var sprite_2d: Sprite2D = $Sprite2D
var close = false


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
	
	EventBus.trash_collected.connect(check_trash)
	

func check_trash (key):
	if !close:
		return
	if key == 0:
		print ("press_red")
		if trash == trashType.drink  or trash == trashType.mug:
			print("Correct! Used bottle and a broken mug goes into the red bin.")  
			queue_free()
		else: 
			get_tree().reload_current_scene()
	elif key == 1:
		print ("press_yellow")
		if trash == trashType.bottle: 
			print("Correct! Plastic bottle goes into the yellow bin.") 
			queue_free()
		else: 
			get_tree().reload_current_scene()
	elif key == 2: 
		print (" press_green")	
		if trash == trashType.apple  or  trash == trashType.banana:
			print("Correct! Apple and banana goes into the green bin.")
			queue_free()
		else: 
			get_tree().reload_current_scene()
func _on_body_entered(body: Node2D) -> void:
	print("Entered trash")
	close = true


func _on_body_exited(body: Node2D) -> void:
	print("Exited trash")
	close = false
