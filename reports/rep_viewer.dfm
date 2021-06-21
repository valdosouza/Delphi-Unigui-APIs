object RepViewer: TRepViewer
  Left = 0
  Top = 0
  ClientHeight = 457
  ClientWidth = 712
  Caption = 'RepViewer'
  WindowState = wsMaximized
  OldCreateOrder = False
  BorderIcons = [biSystemMenu, biMaximize]
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object LinkPDF: TUniURLFrame
    Left = 0
    Top = 25
    Width = 712
    Height = 432
    Hint = ''
    Align = alClient
    TabOrder = 0
    ParentColor = False
    Color = clBtnFace
    object nbttnClose: TUniButton
      Left = 0
      Top = 407
      Width = 712
      Height = 25
      Hint = ''
      Caption = 'Close'
      Align = alBottom
      TabOrder = 1
      OnClick = nbttnCloseClick
    end
  end
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 712
    Height = 25
    Hint = ''
    Align = alTop
    TabOrder = 1
    BorderStyle = ubsFrameLowered
    Caption = 'UniPanel1'
    object UniSpeedButton1: TUniSpeedButton
      Left = 607
      Top = 2
      Width = 103
      Height = 21
      Hint = ''
      Caption = 'Atualizar'
      Align = alRight
      ParentColor = False
      Color = clWindow
      TabOrder = 1
      OnClick = UniSpeedButton1Click
    end
    object E_Link: TUniEdit
      Left = 2
      Top = 2
      Width = 605
      Height = 21
      Hint = ''
      BorderStyle = ubsNone
      Text = ''
      ParentFont = False
      Align = alClient
      TabOrder = 2
    end
  end
end
