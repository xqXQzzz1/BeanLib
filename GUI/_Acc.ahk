﻿
/*
说明:主要是对Acc-ComObj进行分析
*/

Class _Acc{

	AnalyzeFromPoint(ByRef _idChild_ = "", x = "", y = ""){
		return _Acc.Analyze(Acc_ObjectFromPoint(_idChild_,x,y),_idChild_)
	}
	
	Analyze(oAcc,vChildId = -4){
		ComObjError(False)
		theMap := Object()
		
		theMap["RoleNum"] := oAcc.accRole(vChildId)
		theMap["RoleNumHex"] := Format("0x{:X}", vAccRoleNum)
		theMap["StateNum"] := oAcc.accState(vChildId)
		theMap["StateNumHex"] := Format("0x{:X}", vAccStateNum)
		oRect := Acc_Location(oAcc, vChildId)
		theMap["Name"] := oAcc.accName(vChildId)
		theMap["Value"] := oAcc.accValue(vChildId)
		theMap["RoleText"] := Acc_GetRoleText(oAcc.accRole(vChildId))
		theMap["StateText"] := Acc_GetStateText(oAcc.accState(vChildId))
		theMap["StateTextAll"] := JEE_AccGetStateTextAll(vAccStateNum)
		theMap["Action"] := oAcc.accDefaultAction(vChildId)
		theMap["Focus"] := oAcc.accFocus
		theMap["Selection"] := JEE_AccSelection(oAcc)
		StrReplace(vAccSelection, ",",, vCount), vCount += 1
		theMap["SelectionCount"] := (vAccSelection = "") ? 0 : vCount
		theMap["ChildCount"] := oAcc.accChildCount
		theMap["Location"] := Format("X{} Y{} W{} H{}", oRect.x, oRect.y, oRect.w, oRect.h)
		theMap["Description"] := oAcc.accDescription(vChildId)
		theMap["Keyboard"] := oAcc.accKeyboardShortCut(vChildId)
		theMap["Help"] := oAcc.accHelp(vChildId)
		theMap["HelpTopic"] := oAcc.accHelpTopic(vChildId)
		theMap["hWnd"] := := Acc_WindowFromObject(oAcc)
		theMap["Path"] := "--" ;not implemented
		oAcc := ""
		ComObjError(True)
		if(_Acc.checkAnalyzeResult(theMap))
			return theMap
		else
			throw throw(_EX.AccObjectException)
	}
	;------------------------------
	checkAnalyzeResult(aMap){
		if((aMap.ChildCount="")AND(aMap.RoleNum=""))
			return false
		else
			return true
	}
} ;Class _Acc End