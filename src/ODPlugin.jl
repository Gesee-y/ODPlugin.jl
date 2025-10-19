#######################################################################################################################
################################################ OUTDOORS PLUGIN ######################################################
#######################################################################################################################

module ODPlugin

using Cruise
using Outdoors

const ODPLUGIN = CRPlugin()

app = ODApp()
add_system!(ODPlugin)

function Cruise.awake!(n::CRPluginNode{ODApp})
	InitOutdoor()
	setstatus(n, PLUGIN_OK)
end

function Cruise.update!(n::CRPluginNode{ODApp})
	GetEvents(n.obj)
end

function Cruise.shutdown!(n::CRPluginNode{ODApp})
	QuitOutdoor()
	setstatus(n, PLUGIN_OFF)
end

