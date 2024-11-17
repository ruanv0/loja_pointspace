extends Control


var endereco = load("res://endereco.tscn")
var titulo_original = {}
var adicionar_original = {}
var nenhum_original_font_size: float


func _ready() -> void:
	titulo_original["font_size"] = $enderecos_texto.get_theme_font_size("font_size")
	titulo_original["global_position"] = $enderecos_texto.global_position
	adicionar_original["texto_font_size"] = $adicionar/texto.get_theme_font_size("font_size")
	adicionar_original["texto_position"] = $adicionar/texto.position
	adicionar_original["fundo_size"] = $adicionar.size
	nenhum_original_font_size = $nenhum.get_theme_font_size("font_size")
	carregar_enderecos()


func atualizar_interface() -> void:
	if get_viewport_rect().size.y / get_viewport_rect().size.x >= 1:
		global_position.y = 0
		$enderecos_texto.add_theme_font_size_override("font_size", titulo_original["font_size"] * get_viewport_rect().size.x / 720)
		$enderecos_texto.reset_size()
		$enderecos_texto.global_position.x = titulo_original["global_position"].x * get_viewport_rect().size.x / 720
		$enderecos_texto.global_position.y = titulo_original["global_position"].y * get_viewport_rect().size.x / 720
		$escolher.add_theme_font_size_override("font_size", titulo_original["font_size"] * get_viewport_rect().size.x / 720)
		$escolher.reset_size()
		$escolher.global_position.x = titulo_original["global_position"].x * get_viewport_rect().size.x / 720
		$escolher.global_position.y = titulo_original["global_position"].y * get_viewport_rect().size.x / 720
		$adicionar/texto.position.x = adicionar_original["texto_position"].x * get_viewport_rect().size.x / 720
		$adicionar/texto.position.y = adicionar_original["texto_position"].y * get_viewport_rect().size.x / 720
		$adicionar/texto.add_theme_font_size_override("font_size", adicionar_original["texto_font_size"] * get_viewport_rect().size.x / 720)
		$adicionar/texto.reset_size()
		$adicionar.size.x = adicionar_original["fundo_size"].x * get_viewport_rect().size.x / 720
		$adicionar.size.y = adicionar_original["fundo_size"].y * get_viewport_rect().size.x / 720
		$adicionar.global_position.x = get_viewport_rect().size.x - $adicionar.size.x - user_info.margem * get_viewport_rect().size.x / 720
		$adicionar.global_position.y = get_viewport_rect().size.y - $adicionar.size.y - user_info.margem * get_viewport_rect().size.y / 1280
		$nenhum.add_theme_font_size_override("font_size", nenhum_original_font_size * get_viewport_rect().size.x / 720)
		$nenhum.reset_size()
		$nenhum.position.x = (get_viewport_rect().size.x - $nenhum.size.x) / 2
		$nenhum.position.y = (get_viewport_rect().size.y - $nenhum.size.y) / 2
		$enderecos.global_position.y = $enderecos_texto.global_position.y + $enderecos_texto.size.y + user_info.margem * get_viewport_rect().size.y / 1280
		for index in range(0, len($enderecos.get_children()), 1):
			$enderecos.get_child(index).atualizar_interface(user_info.margem * get_viewport_rect().size.x / 720,
	user_info.margem * get_viewport_rect().size.x / 720 + (10 * get_viewport_rect().size.x / 720 + $enderecos.get_child(index).size.y) * index)
		if $enderecos.get_child_count() > 0:
			size.y = $enderecos.get_child(-1).global_position.y + $enderecos.get_child(-1).size.y
		elif $enderecos.get_child_count() == 0:
			size.y = $enderecos_texto.global_position.y + $enderecos_texto.size.y
	elif get_viewport_rect().size.x / get_viewport_rect().size.y >= 1:
		global_position.y = 0
		$enderecos_texto.add_theme_font_size_override("font_size", titulo_original["font_size"] * get_viewport_rect().size.y / 720)
		$enderecos_texto.reset_size()
		$enderecos_texto.global_position.x = titulo_original["global_position"].x * get_viewport_rect().size.x / 720
		$enderecos_texto.global_position.y = titulo_original["global_position"].y * get_viewport_rect().size.x / 720
		$escolher.add_theme_font_size_override("font_size", titulo_original["font_size"] * get_viewport_rect().size.y / 720)
		$escolher.reset_size()
		$escolher.global_position.x = titulo_original["global_position"].x * get_viewport_rect().size.x / 720
		$escolher.global_position.y = titulo_original["global_position"].y * get_viewport_rect().size.x / 720
		$adicionar/texto.position.x = adicionar_original["texto_position"].x * get_viewport_rect().size.x / 720
		$adicionar/texto.position.y = adicionar_original["texto_position"].y * get_viewport_rect().size.x / 720
		$adicionar/texto.add_theme_font_size_override("font_size", adicionar_original["texto_font_size"] * get_viewport_rect().size.x / 720)
		$adicionar/texto.reset_size()
		$adicionar.size.x = adicionar_original["fundo_size"].x * get_viewport_rect().size.x / 720
		$adicionar.size.y = adicionar_original["fundo_size"].y * get_viewport_rect().size.x / 720
		$adicionar.global_position.x = get_viewport_rect().size.x - $adicionar.size.x - user_info.margem * get_viewport_rect().size.x / 1280
		$adicionar.global_position.y = get_viewport_rect().size.y - $adicionar.size.y - user_info.margem * get_viewport_rect().size.y / 720
		$nenhum.add_theme_font_size_override("font_size", nenhum_original_font_size * get_viewport_rect().size.x / 720)
		$nenhum.reset_size()
		$nenhum.position.x = (get_viewport_rect().size.x - $nenhum.size.x) / 2
		$nenhum.position.y = (get_viewport_rect().size.y - $nenhum.size.y) / 2
		$enderecos.global_position.y = $enderecos_texto.global_position.y + $enderecos_texto.size.y + user_info.margem * get_viewport_rect().size.y / 720
		for index in range(0, len($enderecos.get_children()), 1):
			$enderecos.get_child(index).atualizar_interface(user_info.margem * get_viewport_rect().size.x / 1280 + ($enderecos.get_child(index).size.x + 40 * get_viewport_rect().size.x / 1280) * (index % 2),
	user_info.margem * get_viewport_rect().size.x / 1280 + (10 * get_viewport_rect().size.x / 1280 + $enderecos.get_child(index).size.y) * floori(index / 2.0))
		if $enderecos.get_child_count() > 0:
			size.y = $enderecos.get_child(-1).global_position.y + $enderecos.get_child(-1).size.y
		elif $enderecos.get_child_count() == 0:
			size.y = $enderecos_texto.global_position.y + $enderecos_texto.size.y


func carregar_enderecos() -> void:
	for child in $enderecos.get_children():
		child.free()
	if len(user_info.enderecos) == 0:
		$nenhum.visible = true
	else:
		if $nenhum.visible:
			$nenhum.visible = false
		# Para cada instância, dar os seus detalhes
		for index in range(0, len(user_info.enderecos), 1):
			$enderecos.add_child(endereco.instantiate())
			$enderecos.get_child(-1).update_data(user_info.enderecos.keys()[index], "CEP: " + user_info.enderecos.values()[index])
	atualizar_interface()
