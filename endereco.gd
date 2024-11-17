extends Panel


var fundo_original = {}
var nome_original = {}
var cep_original = {}
var deletar_original_texto_font_size: float


func _ready() -> void:
	fundo_original["global_position"] = global_position
	fundo_original["size"] = size
	nome_original["position"] = $nome.position
	nome_original["font_size"] = $nome.get_theme_font_size("font_size")
	cep_original["position"] = $cep.position
	cep_original["font_size"] = $cep.get_theme_font_size("font_size")
	deletar_original_texto_font_size = $deletar_texto.get_theme_font_size("font_size")
	atualizar_interface(position.x, position.y)


func atualizar_interface(x: float, y: float) -> void:
	if get_viewport_rect().size.y / get_viewport_rect().size.x >= 1:
		size.x = fundo_original["size"].x * get_viewport_rect().size.x / 720
		size.y = fundo_original["size"].y * get_viewport_rect().size.x / 720
		
		$nome.position.x = nome_original["position"].x * get_viewport_rect().size.x / 720
		$nome.position.y = nome_original["position"].y * get_viewport_rect().size.x / 720
		$nome.add_theme_font_size_override("font_size", nome_original["font_size"] * get_viewport_rect().size.x / 720)
		$nome.reset_size()
		
		$cep.position.x = cep_original["position"].x * get_viewport_rect().size.x / 720
		$cep.position.y = cep_original["position"].y * get_viewport_rect().size.x / 720
		$cep.add_theme_font_size_override("font_size", cep_original["font_size"] * get_viewport_rect().size.x / 720)
		$cep.reset_size()
		
		$deletar_icone.scale = Vector2(get_viewport_rect().size.x / 720, get_viewport_rect().size.x / 720)
		$deletar_texto.add_theme_font_size_override("font_size", deletar_original_texto_font_size * get_viewport_rect().size.x / 720)
		$deletar_texto.reset_size()
		
		$deletar_icone.position.x = size.x - 20 * $deletar_icone.scale.x - $deletar_texto.size.x + ($deletar_texto.size.x - $deletar_icone.size.x * $deletar_icone.scale.x) / 2
		$deletar_icone.position.y = (size.y - $deletar_texto.size.y - $deletar_icone.size.y * $deletar_icone.scale.y) / 2
		$deletar_texto.position.x = size.x - 20 * $deletar_icone.scale.x - $deletar_texto.size.x
		$deletar_texto.position.y = (size.y - $deletar_texto.size.y - $deletar_icone.size.y * $deletar_icone.scale.y) / 2 + $deletar_icone.size.y * $deletar_icone.scale.y
		
		position.x = x
		position.y = y
	elif get_viewport_rect().size.x / get_viewport_rect().size.y >= 1:
		size.x = fundo_original["size"].x * get_viewport_rect().size.x / 720 / 2
		size.y = fundo_original["size"].y * get_viewport_rect().size.x / 720 / 2
		
		$nome.position.x = nome_original["position"].x * get_viewport_rect().size.x / 720 / 2
		$nome.position.y = nome_original["position"].y * get_viewport_rect().size.x / 720 / 2
		$nome.add_theme_font_size_override("font_size", nome_original["font_size"] * get_viewport_rect().size.x / 720 / 2)
		$nome.reset_size()
		
		$cep.position.x = cep_original["position"].x * get_viewport_rect().size.x / 720 / 2
		$cep.position.y = cep_original["position"].y * get_viewport_rect().size.x / 720 / 2
		$cep.add_theme_font_size_override("font_size", cep_original["font_size"] * get_viewport_rect().size.x / 720 / 2)
		$cep.reset_size()
		
		$deletar_icone.scale = Vector2(get_viewport_rect().size.x / 720 / 2, get_viewport_rect().size.x / 720 / 2)
		$deletar_texto.add_theme_font_size_override("font_size", deletar_original_texto_font_size * get_viewport_rect().size.x / 720 / 2)
		$deletar_texto.reset_size()
		
		$deletar_icone.position.x = size.x - 20 * $deletar_icone.scale.x - $deletar_texto.size.x + ($deletar_texto.size.x - $deletar_icone.size.x * $deletar_icone.scale.x) / 2
		$deletar_icone.position.y = (size.y - $deletar_texto.size.y - $deletar_icone.size.y * $deletar_icone.scale.y) / 2
		$deletar_texto.position.x = size.x - 20 * $deletar_icone.scale.x - $deletar_texto.size.x
		$deletar_texto.position.y = (size.y - $deletar_texto.size.y - $deletar_icone.size.y * $deletar_icone.scale.y) / 2 + $deletar_icone.size.y * $deletar_icone.scale.y
		
		position.x = x
		position.y = y


func deletar_global_position() -> Vector2:
	return Vector2($deletar_texto.global_position.x, $deletar_icone.global_position.y)


func deletar_size() -> Vector2: 
	return Vector2($deletar_texto.size.x,
				   $deletar_icone.size.y * $deletar_icone.scale.y + $deletar_texto.size.y)


func update_data(name_string: String, cep: String) -> void:
	name = name_string
	$nome.text = name_string
	$cep.text = cep
