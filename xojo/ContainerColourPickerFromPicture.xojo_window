#tag DesktopWindow
Begin DesktopContainer ContainerColourPickerFromPicture
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
   Begin ContainerPicture Pics
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
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   7
      Transparent     =   True
      Visible         =   True
      Width           =   542
   End
   Begin CanvasButton CanvasLoadButton
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   94316543
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
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   7
      Transparent     =   True
      Visible         =   True
      Width           =   32
   End
   Begin CanvasButton CanvasAspectRatioButton
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   1938849791
      Enabled         =   True
      Height          =   32
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   561
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   2
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   310
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
      Left            =   575
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   2
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
		  
		  if self.Pics.Bounds.Contains( p ) then
		    
		    self.setCursorPosition( p )
		    
		    
		    p.Translate( - self.Pics.Left, - self.Pics.Top )
		    
		    
		    var c as Color = self.Pics.getColourAt( p )
		    
		    
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
		  
		  if p.X < self.Pics.Bounds.Left then
		    
		    p.X = self.Pics.Bounds.Left
		    
		  elseif p.X > self.Pics.Bounds.Right then
		    
		    p.X = self.Pics.Bounds.Right
		    
		  end if
		  
		  if p.Y < self.Pics.Bounds.Top then
		    
		    p.Y = self.Pics.Bounds.Top
		    
		  elseif p.Y > self.Pics.Bounds.Bottom then
		    
		    p.Y = self.Pics.Bounds.Bottom
		    
		  end if
		  
		  self.setCursorPosition( p )
		  
		  
		  p.Translate( - self.Pics.Left, - self.Pics.Top )
		  
		  
		  var c as Color = self.Pics.getColourAt( p )
		  
		  
		  if c <> self.colour then
		    
		    self.colourWasPicked( c )
		    
		  end if
		  
		  
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
		Function getColour() As Color
		  return self.colour
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function getCursorPosition() As Point
		  return new Point( self.OvalCursor.Left + ( self.OvalCursor.Width / 2 ), self.OvalCursor.Top + ( self.OvalCursor.Height / 2 ) )
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getPictureFolderItem() As FolderItem
		  return self.Pics.getFolderItem()
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setColour(colour as Color)
		  // doesn't do anything
		  
		  #pragma unused colour
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub setCursorPosition(p as Point)
		  self.OvalCursor.Left = p.X - ( self.OvalCursor.Width / 2 )
		  
		  self.OvalCursor.Top = p.Y - ( self.OvalCursor.Height / 2 )
		  
		  self.tweakCursorVisibility()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setPicture(f as FolderItem)
		  self.Pics.load( f )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub tweakCursorVisibility()
		  var c as Color = self.Pics.getColourAt( self.getCursorPosition() )
		  
		  if c.Value > 0.5 then
		    
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


#tag EndWindowCode

#tag Events CanvasLoadButton
	#tag Event
		Sub Action()
		  var dlg as OpenFileDialog = new OpenFileDialog()
		  
		  dlg.ActionButtonCaption = "Select Files"
		  dlg.CancelButtonCaption = "Cancel"
		  // dlg.SuggestedFileName = ""
		  
		  dlg.Title = "Select Files"
		  
		  dlg.PromptText = "Select one or more files"
		  
		  dlg.InitialFolder = SpecialFolder.Pictures
		  
		  dlg.AllowMultipleSelections = False
		  
		  Var f As FolderItem = dlg.ShowModal
		  
		  if f = nil then return
		  
		  self.Pics.load( f )
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CanvasAspectRatioButton
	#tag Event
		Sub Action()
		  System.DebugLog( "toggle pic in pro" )
		  
		  
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
