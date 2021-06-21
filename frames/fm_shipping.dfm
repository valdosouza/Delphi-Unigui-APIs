inherited FmShipping: TFmShipping
  Width = 635
  Height = 216
  ExplicitWidth = 635
  ExplicitHeight = 216
  object Pnl_Entrega: TUniPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 216
    Hint = ''
    Align = alClient
    TabOrder = 0
    BorderStyle = ubsFrameLowered
    Caption = ''
    ExplicitHeight = 172
    object Ctn_AdressDelivery: TUniContainerPanel
      Left = 2
      Top = 2
      Width = 631
      Height = 52
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 1
    end
    object Ctn_Carrier: TUniContainerPanel
      Left = 2
      Top = 54
      Width = 631
      Height = 52
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 2
    end
    object Ctn_Freight_Mode: TUniContainerPanel
      Left = 2
      Top = 106
      Width = 631
      Height = 52
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 3
    end
    object pnl_Row_4: TUniPanel
      Left = 2
      Top = 158
      Width = 631
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 4
      BorderStyle = ubsNone
      Caption = ''
      ExplicitLeft = 3
      ExplicitTop = 161
      object E_Help_Reference: TUniEdit
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 496
        Height = 39
        Hint = ''
        Margins.Bottom = 8
        Text = ''
        Align = alClient
        TabOrder = 1
        FieldLabel = 'Ponto de Refer'#234'ncia'
        FieldLabelAlign = laTop
        ExplicitTop = 5
        ExplicitWidth = 484
        ExplicitHeight = 120
      end
      object DtpDataDelivery: TUniDateTimePicker
        AlignWithMargins = True
        Left = 506
        Top = 4
        Width = 121
        Height = 39
        Hint = ''
        Margins.Bottom = 8
        DateTime = 42963.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Align = alRight
        TabOrder = 2
        FieldLabel = 'PRazo de Entrega'
        FieldLabelAlign = laTop
        ExplicitLeft = 494
        ExplicitTop = 5
        ExplicitHeight = 120
      end
    end
  end
end
