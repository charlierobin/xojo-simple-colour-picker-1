#tag Module
Protected Module ExtendsColor
	#tag Method, Flags = &h0
		Function isGrayscale(extends c as Color) As Boolean
		  return c.Red = c.Green and c.Red = c.Blue and c.Green = c.Blue
		  
		  
		End Function
	#tag EndMethod


End Module
#tag EndModule
