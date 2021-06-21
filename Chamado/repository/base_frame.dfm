object BaseFrame: TBaseFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Align = alClient
  Anchors = [akLeft, akTop, akRight, akBottom]
  TabOrder = 0
  object pnl_Top: TUniPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 33
    Hint = ''
    Align = alTop
    TabOrder = 0
    BorderStyle = ubsFrameLowered
    Caption = ''
    Color = clActiveCaption
    object Lb_Numero: TUniLabel
      Left = 3
      Top = 3
      Width = 109
      Height = 23
      Hint = ''
      Caption = 'Titulo da tela'
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -19
      TabOrder = 1
    end
  end
end
