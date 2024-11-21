extends Control


var titulo_original = {}
var cep_original = {}
var nome_original = {}
var salvar_original = {}
var erro_original = {}


func _ready() -> void:
	titulo_original["font_size"] = $titulo.get_theme_font_size("font_size")
	titulo_original["global_position"] = $titulo.global_position
	cep_original["cep_titulo_font_size"] = $cep.get_theme_font_size("font_size")
	cep_original["cep_titulo_global_position"] = $cep.global_position
	cep_original["cep_edit_font_size"] = $cep_edit.get_theme_font_size("font_size")
	cep_original["cep_edit_global_position"] = $cep_edit.global_position
	cep_original["cep_edit_size_x"] = $cep_edit.size.x
	nome_original["nome_titulo_font_size"] = $nome.get_theme_font_size("font_size")
	nome_original["nome_titulo_global_position"] = $nome.global_position
	nome_original["nome_edit_font_size"] = $nome_edit.get_theme_font_size("font_size")
	nome_original["nome_edit_global_position"] = $nome_edit.global_position
	nome_original["nome_edit_size_x"] = $nome_edit.size.x
	salvar_original["texto_font_size"] = $salvar/texto.get_theme_font_size("font_size")
	salvar_original["texto_position"] = $salvar/texto.position
	salvar_original["fundo_size"] = $salvar.size
	salvar_original["margem"] = Vector2(720, 1280) - $salvar.global_position - $salvar.size
	erro_original["font_size"] = $erro.get_theme_font_size("font_size")
	erro_original["position"] = $erro.position
	atualizar_interface()


func atualizar_interface() -> void:
	if get_viewport_rect().size.y / get_viewport_rect().size.x >= 1:
		$titulo.global_position.x = titulo_original["global_position"].x * get_viewport_rect().size.x / 720
		$titulo.global_position.y = titulo_original["global_position"].y * get_viewport_rect().size.x / 720
		$titulo.add_theme_font_size_override("font_size", titulo_original["font_size"] * get_viewport_rect().size.x / 720)
		$titulo.reset_size()
		$cep.global_position.x = cep_original["cep_titulo_global_position"].x * get_viewport_rect().size.x / 720
		$cep.global_position.y = cep_original["cep_titulo_global_position"].y * get_viewport_rect().size.x / 720
		$cep.add_theme_font_size_override("font_size", cep_original["cep_titulo_font_size"] * get_viewport_rect().size.x / 720)
		$cep.reset_size()
		$cep_edit.global_position.x = cep_original["cep_edit_global_position"].x * get_viewport_rect().size.x / 720
		$cep_edit.global_position.y = cep_original["cep_edit_global_position"].y * get_viewport_rect().size.x / 720
		$cep_edit.add_theme_font_size_override("font_size", cep_original["cep_edit_font_size"] * get_viewport_rect().size.x / 720)
		$cep_edit.reset_size()
		$cep_edit.size.x = cep_original["cep_edit_size_x"] * get_viewport_rect().size.x / 720
		$nome.global_position.x = nome_original["nome_titulo_global_position"].x * get_viewport_rect().size.x / 720
		$nome.global_position.y = nome_original["nome_titulo_global_position"].y * get_viewport_rect().size.x / 720
		$nome.add_theme_font_size_override("font_size", nome_original["nome_titulo_font_size"] * get_viewport_rect().size.x / 720)
		$nome.reset_size()
		$nome_edit.global_position.x = nome_original["nome_edit_global_position"].x * get_viewport_rect().size.x / 720
		$nome_edit.global_position.y = nome_original["nome_edit_global_position"].y * get_viewport_rect().size.x / 720
		$nome_edit.add_theme_font_size_override("font_size", nome_original["nome_edit_font_size"] * get_viewport_rect().size.x / 720)
		$nome_edit.reset_size()
		$nome_edit.size.x = nome_original["nome_edit_size_x"] * get_viewport_rect().size.x / 720
		$salvar/texto.position.x = salvar_original["texto_position"].x * get_viewport_rect().size.x / 720
		$salvar/texto.position.y = salvar_original["texto_position"].y * get_viewport_rect().size.x / 720
		$salvar/texto.add_theme_font_size_override("font_size", salvar_original["texto_font_size"] * get_viewport_rect().size.x / 720)
		$salvar/texto.reset_size()
		$salvar.size.x = salvar_original["fundo_size"].x * get_viewport_rect().size.x / 720
		$salvar.size.y = salvar_original["fundo_size"].y * get_viewport_rect().size.x / 720
		$salvar.global_position.x = get_viewport_rect().size.x - $salvar.size.x - salvar_original["margem"].x * get_viewport_rect().size.x / 720
		$salvar.global_position.y = get_viewport_rect().size.y - $salvar.size.y - salvar_original["margem"].y * get_viewport_rect().size.y / 1280
		$erro.position.x = erro_original["position"].x * get_viewport_rect().size.x / 720
		$erro.position.y = erro_original["position"].y * get_viewport_rect().size.x / 720
		$erro.add_theme_font_size_override("font_size", erro_original["font_size"] * get_viewport_rect().size.x / 720)
		$erro.reset_size()
	elif get_viewport_rect().size.x / get_viewport_rect().size.y > 1:
		$titulo.global_position.x = titulo_original["global_position"].x * get_viewport_rect().size.y / 720
		$titulo.global_position.y = titulo_original["global_position"].y * get_viewport_rect().size.y / 720
		$titulo.add_theme_font_size_override("font_size", titulo_original["font_size"] * get_viewport_rect().size.y / 720)
		$titulo.reset_size()
		$cep.global_position.x = cep_original["cep_titulo_global_position"].x * get_viewport_rect().size.y / 720
		$cep.global_position.y = cep_original["cep_titulo_global_position"].y * get_viewport_rect().size.y / 720
		$cep.add_theme_font_size_override("font_size", cep_original["cep_titulo_font_size"] * get_viewport_rect().size.y / 720)
		$cep.reset_size()
		$cep_edit.global_position.x = cep_original["cep_edit_global_position"].x * get_viewport_rect().size.y / 720
		$cep_edit.global_position.y = cep_original["cep_edit_global_position"].y * get_viewport_rect().size.y / 720
		$cep_edit.add_theme_font_size_override("font_size", cep_original["cep_edit_font_size"] * get_viewport_rect().size.y / 720)
		$cep_edit.reset_size()
		$cep_edit.size.x = cep_original["cep_edit_size_x"] * get_viewport_rect().size.y / 720
		$nome.global_position.x = nome_original["nome_titulo_global_position"].x * get_viewport_rect().size.y / 720
		$nome.global_position.y = nome_original["nome_titulo_global_position"].y * get_viewport_rect().size.y / 720
		$nome.add_theme_font_size_override("font_size", nome_original["nome_titulo_font_size"] * get_viewport_rect().size.y / 720)
		$nome.reset_size()
		$nome_edit.global_position.x = nome_original["nome_edit_global_position"].x * get_viewport_rect().size.y / 720
		$nome_edit.global_position.y = nome_original["nome_edit_global_position"].y * get_viewport_rect().size.y / 720
		$nome_edit.add_theme_font_size_override("font_size", nome_original["nome_edit_font_size"] * get_viewport_rect().size.y / 720)
		$nome_edit.reset_size()
		$nome_edit.size.x = nome_original["nome_edit_size_x"] * get_viewport_rect().size.y / 720
		$salvar/texto.position.x = salvar_original["texto_position"].x * get_viewport_rect().size.y / 720
		$salvar/texto.position.y = salvar_original["texto_position"].y * get_viewport_rect().size.y / 720
		$salvar/texto.add_theme_font_size_override("font_size", salvar_original["texto_font_size"] * get_viewport_rect().size.y / 720)
		$salvar/texto.reset_size()
		$salvar.size.x = salvar_original["fundo_size"].x * get_viewport_rect().size.y / 720
		$salvar.size.y = salvar_original["fundo_size"].y * get_viewport_rect().size.y / 720
		$salvar.global_position.x = get_viewport_rect().size.x - $salvar.size.x - salvar_original["margem"].x * get_viewport_rect().size.x / 1280
		$salvar.global_position.y = get_viewport_rect().size.y - $salvar.size.y - salvar_original["margem"].y * get_viewport_rect().size.y / 720
		$erro.position.x = erro_original["position"].x * get_viewport_rect().size.y / 720
		$erro.position.y = erro_original["position"].y * get_viewport_rect().size.y / 720
		$erro.add_theme_font_size_override("font_size", erro_original["font_size"] * get_viewport_rect().size.y / 720)
		$erro.reset_size()


func _on_cep_edit_text_changed(new_text) -> void:
	var quantos_algarismos = 0
	# Contagem de quantos algarismos do CEP escrito
	var quantos_tracos = 0
	# Contagem de quantos traços do CEP escrito
	for i in new_text:
		if i in "0123456789":
			quantos_algarismos += 1
		if i == "-":
			quantos_tracos += 1
	# O CEP deve ter 8 algarismos, o outro caractere deve ser um traço
	# Caso passe do limite, remover o último caractere
	if quantos_algarismos == 9:
		new_text = new_text.erase(8)
	# Só se pode ter um traço no CEP
	if quantos_tracos == 2:
		new_text = new_text.erase(len(new_text) - 2)
	# O CEP só pode ter 8 algarismos e 1 traço
	for i in range(0, len(new_text), 1):
		if new_text[i] not in "0123456789-":
			new_text = new_text.erase(i)
	if $cep_edit.text != new_text:
		$cep_edit.text = new_text


func salvar() -> void:
	var erro = ""
	# Corrigindo o traço do CEP...
	var contagem_cep = 0
	for i in str($cep_edit.text):
		if i in "0123456789":
			contagem_cep += 1
	var cep = str($cep_edit.text).replace("-", "")
	cep = cep.insert(5, "-")
	# Salvar o endereço caso o CEP e o nome estejam certos
	# e não existir CEP ou endereço que já esteja salvo
	if contagem_cep == 8 and len($nome_edit.text) > 0 and $nome_edit.text not in user_info.enderecos.keys() and cep not in user_info.enderecos.values():
		user_info.enderecos[$nome_edit.text] = cep
		user_info.save()
		$"../menu_enderecos".visible = true
		$"../menu_enderecos".carregar_enderecos()
		visible = false
	# Verificação de erros na escrita do nome do endereço ou
	# CEP para adicionar eles na tela
	if contagem_cep < 8:
		erro = erro + "Este CEP é inválido.\n"
	elif contagem_cep == 8:
		erro = erro.replace("Este CEP é inválido.\n", "")
	if len($nome_edit.text) == 0:
		erro = erro + "Não há nada escrito no nome do\nendereço.\n"
	elif len($nome_edit.text) > 0:
		erro = erro.replace("Não há nada escrito no nome do\nendereço.\n", "")
	if $nome_edit.text in user_info.enderecos.keys():
		erro = erro + "Esse nome do endereço já foi\nadicionado.\n"
	elif $nome_edit.text not in user_info.enderecos.keys():
		erro = erro.replace("Esse nome do endereço já foi\nadicionado.\n", "")
	if cep in user_info.enderecos.values():
		erro = erro + "Esse CEP já foi adicionado.\n"
	elif cep not in user_info.enderecos.values():
		erro = erro.replace("Esse CEP já foi adicionado.\n", "")
	$erro.text = erro
