#tag DesktopWindow
Begin DesktopContainer ContainerColourPickerFromSpectrum
   AllowAutoDeactivate=   True
   AllowFocus      =   False
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF
   Composited      =   False
   Enabled         =   True
   HasBackgroundColor=   False
   Height          =   350
   Index           =   -2147483648
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Tooltip         =   ""
   Top             =   0
   Transparent     =   True
   Visible         =   True
   Width           =   600
   Begin ContainerGradients Gradients
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   False
      AllowTabs       =   True
      Backdrop        =   0
      BackgroundColor =   &cFFFFFF
      Composited      =   False
      Enabled         =   True
      HasBackgroundColor=   False
      Height          =   336
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   7
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   7
      Transparent     =   True
      Visible         =   True
      Width           =   542
   End
   Begin CanvasButtonEyeDropper CanvasLaunchEyeDropper
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   1149081599
      Enabled         =   True
      Height          =   32
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   561
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   7
      Transparent     =   True
      Visible         =   True
      Width           =   32
   End
   Begin DesktopOval OvalCursor
      AllowAutoDeactivate=   True
      BorderColor     =   &c000000
      BorderThickness =   3.0
      Enabled         =   True
      FillColor       =   &cFFFFFFFF
      Height          =   9
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   575
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   13
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   114
      Transparent     =   False
      Visible         =   True
      Width           =   9
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  var p as Point = new Point( x, y )
		  
		  if self.Gradients.Bounds.Contains( p ) then
		    
		    self.setCursorPosition( p )
		    
		    
		    p.Translate( - self.Gradients.Left, - self.Gradients.Top )
		    
		    
		    var c as Color = self.Gradients.getColourAt( p )
		    
		    if c <> self.colour then
		      
		      self.colourWasPicked( c )
		      
		      return true
		      
		    end if
		    
		  end if
		  
		  return false
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(x As Integer, y As Integer)
		  var p as Point = new Point( x, y )
		  
		  if p.X < self.Gradients.Bounds.Left then
		    
		    p.X = self.Gradients.Bounds.Left
		    
		  elseif p.X > self.Gradients.Bounds.Right then
		    
		    p.X = self.Gradients.Bounds.Right
		    
		  end if
		  
		  if p.Y < self.Gradients.Bounds.Top then
		    
		    p.Y = self.Gradients.Bounds.Top
		    
		  elseif p.Y > self.Gradients.Bounds.Bottom then
		    
		    p.Y = self.Gradients.Bounds.Bottom
		    
		  end if
		  
		  self.setCursorPosition( p )
		  
		  
		  p.Translate( - self.Gradients.Left, - self.Gradients.Top )
		  
		  
		  var c as Color = self.Gradients.getColourAt( p )
		  
		  
		  if c <> self.colour then
		    
		    self.colourWasPicked( c )
		    
		  end if
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  var p as Point = self.Gradients.getPointFor( self.colour )
		  
		  p.Translate( self.Gradients.Left, self.Gradients.Top )
		  
		  self.setCursorPosition( p )
		  
		  // self.Refresh()
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  var p as Point = self.Gradients.getPointFor( self.colour )
		  
		  p.Translate( self.Gradients.Left, self.Gradients.Top )
		  
		  self.setCursorPosition( p )
		  
		  // self.Refresh()
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub colourWasPicked(colour as Color)
		  RaiseEvent ColourPicked( colour )
		  
		  if self.Parent isA ContainerColourPicker then
		    
		    ContainerColourPicker( self.Parent ).colourWasPicked( self, colour )
		    
		  end if
		  
		  self.colour = colour
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setColour(colour as Color)
		  var p as Point = self.Gradients.getPointFor( colour )
		  
		  p.Translate( self.Gradients.Left, self.Gradients.Top )
		  
		  self.setCursorPosition( p )
		  
		  self.colour = colour
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub setCursorPosition(p as Point)
		  self.OvalCursor.Left = p.X - ( self.OvalCursor.Width / 2 )
		  
		  self.OvalCursor.Top = p.Y - ( self.OvalCursor.Height / 2 )
		  
		  self.tweakCursorVisibility()
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub tweakCursorVisibility()
		  var boundary as Double = ( self.Height / 4 ) * 3
		  
		  if self.OvalCursor.Top < boundary then
		    
		    self.OvalCursor.BorderColor = Color.Black
		    
		  else
		    
		    self.OvalCursor.BorderColor = Color.White
		    
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ColourPicked(colour as Color)
	#tag EndHook


	#tag Property, Flags = &h21
		Private colour As Color
	#tag EndProperty


	#tag Structure, Name = colourStruct, Flags = &h21
		red as CGFloat
		  green as CGFloat
		blue as CGFloat
	#tag EndStructure


#tag EndWindowCode

#tag Events CanvasLaunchEyeDropper
	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  #pragma unused X
		  #pragma unused Y
		  
		  const dylib = "@executable_path/../Frameworks/libScreenSampler.dylib"
		  
		  declare function ColourAtScreenCoordinate lib dylib ( mX as Integer, mY as Integer ) as colourStruct
		  
		  var screenPointColour as colourStruct = ColourAtScreenCoordinate( System.MouseX, System.MouseY )
		  
		  var c as Color = Color.RGB( screenPointColour.red, screenPointColour.green, screenPointColour.blue )
		  
		  // System.DebugLog( c.ToString() )
		  
		  if c <> self.colour then
		    
		    var p as Point = self.Gradients.getPointFor( c )
		    
		    p.Translate( self.Gradients.Left, self.Gradients.Top )
		    
		    self.setCursorPosition( p )
		    
		    self.colourWasPicked( c )
		    
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
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
		Name="Super"
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
		InitialValue="-2147483648"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Visible=false
		Group="Position"
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
		InitialValue="False"
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
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="ColorGroup"
		EditorType="ColorGroup"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
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
		InitialValue="True"
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
	#tag ViewProperty
		Name="Composited"
		Visible=true
		Group="Window Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
