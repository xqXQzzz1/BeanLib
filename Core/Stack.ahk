﻿
 class Stack{
	list := Array()
	length(){
		return this.list.length()
	}
	__New(){
	}
	
	empty(){
		if(this.length() = 0)
			return true
		else
			return false
	}
	
	peek(){
		
	}
	
	pop(){
		
	}
	
	push(aElement){
		return this.list.push(aElement)
	}
	
	search(aElement){
		thePos := this.list.Length()
		while(thePos>0){
			if(aElement =  this.list[thePos])
				return thePos
			else
				thePos--
		}
		return false
	}
} ;---------class Stack End