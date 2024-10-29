#tag DesktopWindow
Begin DesktopContainer ContainerColourPicker
   AllowAutoDeactivate=   True
   AllowFocus      =   False
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF
   Composited      =   False
   Enabled         =   True
   HasBackgroundColor=   False
   Height          =   346
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
   Width           =   566
   Begin ContainerColourPickerFromSpectrum ColourPicker
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   False
      AllowTabs       =   True
      Backdrop        =   0
      BackgroundColor =   &cFFFFFF
      Composited      =   False
      Enabled         =   True
      HasBackgroundColor=   False
      Height          =   310
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   36
      Transparent     =   True
      Visible         =   True
      Width           =   566
   End
   BeginDesktopSegmentedButton DesktopSegmentedButton SegmentedButtonMode
      Enabled         =   True
      Height          =   24
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   2
      Segments        =   "Colour Spectrum\n\nTrue\rPicture\n\nFalse"
      SelectionStyle  =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   False
      Tooltip         =   ""
      Top             =   0
      Transparent     =   False
      Visible         =   True
      Width           =   558
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Opening()
		  self.ccPicker = self.ColourPicker
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub colourWasPicked(sender as Variant, colour as Color)
		  #pragma unused sender
		  
		  RaiseEvent ColourPicked( colour )
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setColour(colour as Color)
		  if self.ccPicker isA ContainerColourPickerFromSpectrum then 
		    
		    ContainerColourPickerFromSpectrum( self.ccPicker ).setColour( colour )
		    
		  elseif self.ccPicker isA ContainerColourPickerFromPicture then 
		    
		    ContainerColourPickerFromPicture( self.ccPicker ).setColour( colour )
		    
		  else
		    
		    // nothing
		    
		  end if
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ColourPicked(colour as Color)
	#tag EndHook


	#tag Property, Flags = &h21
		Private ccPicker As DesktopContainer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private lastPic As FolderItem
	#tag EndProperty


#tag EndWindowCode

#tag Events SegmentedButtonMode
	#tag Event
		Sub Pressed(segmentIndex As Integer)
		  var pressed as String = me.SegmentAt( segmentIndex ).Caption
		  
		  var bounds as Rect = self.ccPicker.Bounds
		  
		  select case pressed
		    
		  case "Colour Spectrum"
		    
		    if self.ccPicker isA ContainerColourPickerFromSpectrum then return
		    
		    self.lastPic = ContainerColourPickerFromPicture( self.ccPicker ).getPictureFolderItem()
		    
		    var c as Color = ContainerColourPickerFromPicture( self.ccPicker ).getColour()
		    
		    self.ccPicker.Close()
		    
		    self.ccPicker = new ContainerColourPickerFromSpectrum()
		    
		    self.ccPicker.EmbedWithin( self, bounds.Left, bounds.Top, bounds.Width, bounds.Height )
		    
		    ContainerColourPickerFromSpectrum( self.ccPicker ).setColour( c )
		    
		  case "Picture"
		    
		    if self.ccPicker isA ContainerColourPickerFromPicture then return
		    
		    self.ccPicker.Close()
		    
		    self.ccPicker = new ContainerColourPickerFromPicture()
		    
		    self.ccPicker.EmbedWithin( self, bounds.Left, bounds.Top, bounds.Width, bounds.Height )
		    
		    if self.lastPic = nil then
		      
		      self.lastPic = SpecialFolder.Resources.Child( "Freebie-GradientTextures-01.jpg" )
		      
		    end if
		    
		    ContainerColourPickerFromPicture( self.ccPicker ).setPicture( self.lastPic )
		    
		  case else
		    
		    System.DebugLog( pressed )
		    
		  end select
		  
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
