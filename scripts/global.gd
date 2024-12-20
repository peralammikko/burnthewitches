extends Node2D

var selectedObject: Node
var isInspecting = false
var isCameraUp = true

var alignStats = {
	"order": 0,
	"rebel": 0,
	"good": 0,
	"evil": 0
}

func resetStats():
	alignStats["order"] = 0
	alignStats["rebel"] = 0
	alignStats["good"] = 0
	alignStats["evil"] = 0

func getHighest():
	var valueArr = []
	for stat in alignStats:
		valueArr.push_back(alignStats[stat])
	var topStat = valueArr.max()
	return topStat
