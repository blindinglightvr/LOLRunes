;arr:={a:10,b:"test",c:"AHK",1:2,2:"hello",base:{SortKey:"SortArrayByKey",SortValue:"SortArrayByValue"}}

;MsgBox % blah.SortKey("ByValue")
;MsgBox % arr.SortValue()
;MsgBox % arr.SortValue("ByKey")
SortArrayByValue(array,options="",delimiter="`n"){
   If InStr(Options,"ByKey"){
      StringReplace,options,options,ByKey
      for k in array
         out.= k delimiter
      StringTrimRight,out,out,1
      Sort,out,%options%
      Loop,Parse,out,%delimiter%
         out_.=Array[A_LoopField] Delimiter
      out:=out_
   } else {
      for k, v in array
         out.= v delimiter
      StringTrimRight,out,out,1
      Sort,out,%options%
   }
   return out
}
SortArrayByKey(array,options="",delimiter="`n"){
   If InStr(Options,"ByValue"){
      StringReplace,options,options,ByValue
      arrsort:={}
      for k, v in array
         out.= v delimiter,(arrsort[v]:=arrsort[v]?arrsort[v]:{}).Insert(k)
      StringTrimRight,out,out,1
      Sort,out,%options% U
      Loop,Parse,out,%delimiter%
         Loop % arrsort[A_LoopField].MaxIndex()
            out_.=arrsort[A_LoopField,A_Index] Delimiter
      out:=out_
   } else {
      for k, v in array
         out.= k delimiter
      StringTrimRight,out,out,1
      Sort,out,%options%
   }
   return out
}

blah := {Caitlyn: "caitlyn.png", Diana: "diana.jpg", Graves: "graves.png", Kayn: "kayn.png", "Miss Fortune": "missfortune.png", Rammus: "rammus.png", Thresh: "thresh.png", Udyr: "udyr.png", Yasuo: "yasuo.png"}

Space := " "
For key, value in blah {
	msgbox "    "%key%[%value%]%Space%%A_Index%
	
	}
	
;array := {Caitlyn: "cait", twenty: 20, thirty: 30}
;For key, value in array
    ;MsgBox %key% = %value%
	
	MsgBox % blah.SortKey("ByValue")