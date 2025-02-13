extends Resource
class_name Renderable

var _nodes: Array[Node] = []
var _node_ids: Array[int] = []
var _func_names: Array[String] = []

func bind_scene(node: Node, func_name: String = "update"):
	var id = node.get_instance_id()
	_nodes.append(node)
	_node_ids.append(id)
	_func_names.append(func_name)

func unbind_scene(node: Node):
	var id = node.get_instance_id()
	var i = _node_ids.find(id)
	if i < 0:
		return
	_nodes.remove_at(i)
	_node_ids.remove_at(i)
	_func_names.remove_at(i)

func notify_scenes():
	for i in range(_nodes.size()):
		var node = _nodes[i]
		var func_name = _func_names[i]
		node.call(func_name, self)
