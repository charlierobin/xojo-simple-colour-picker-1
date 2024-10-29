#tag Class
Protected Class ColourGradient
Inherits CachingCanvas
	#tag Event
		Sub Render(g as Graphics)
		  #pragma BoundsChecking false
		  
		  #pragma BackgroundTasks false
		  
		  var midPoint as Double = g.Height / 2
		  
		  for x as Double = 0 to g.Width
		    
		    for y as Double = 0 to g.Height
		      
		      if y < midPoint then
		        
		        g.DrawingColor = Color.HSV( x / g.Width, 1 - ( ( midPoint - y ) / midPoint ), 1 )
		        
		      elseif y > midPoint then
		        
		        g.DrawingColor = Color.HSV( x / g.Width, 1, 1 - ( ( y - midPoint ) / midPoint ) )
		        
		      end if
		      
		      g.FillRectangle( x, y, 1, 1 )
		      
		    next
		    
		  next
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function getColourAt(p as Point) As Color
		  var midPoint as Double = self.Height / 2
		  
		  var c as Color = Color.Orange
		  
		  if p.Y < midPoint then
		    
		    c = Color.HSV( p.X / self.Width, 1 - ( ( midPoint - p.Y ) / midPoint ), 1 )
		    
		  elseif p.Y > midPoint then
		    
		    c = Color.HSV( p.X / self.Width, 1, 1 - ( ( p.Y - midPoint ) / midPoint ) )
		    
		  end if
		  
		  return c
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getPointFor(c as Color) As Point
		  var x as Integer = c.Hue * self.Width
		  
		  var halfWay as Integer = self.Height / 2
		  
		  var y as Integer = halfWay
		  
		  if c.Saturation = 1 and c.Value = 1 then
		    
		    // nothing
		    
		  elseif c.Saturation < 1 then
		    
		    y = halfWay * c.Saturation
		    
		  elseif c.Value < 1 then
		    
		    y = halfWay + ( ( 1 - c.Value ) * halfWay )
		    
		  end if
		  
		  return new Point( x, y )
		  
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocus"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowTabs"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
