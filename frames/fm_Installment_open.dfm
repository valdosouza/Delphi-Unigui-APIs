inherited FmInstallmentOpen: TFmInstallmentOpen
  Width = 353
  Height = 52
  TabStop = True
  ExplicitWidth = 353
  ExplicitHeight = 52
  object E_Plots: TUniEdit
    AlignWithMargins = True
    Left = 3
    Top = 0
    Width = 48
    Height = 52
    Hint = ''
    Margins.Top = 0
    Margins.Bottom = 0
    CharCase = ecUpperCase
    Text = ''
    Align = alLeft
    TabOrder = 0
    FieldLabel = 'Parcelas'
    FieldLabelAlign = laTop
    OnExit = E_PlotsExit
    ExplicitTop = 20
    ExplicitHeight = 22
  end
  object E_DeadLine: TUniEdit
    AlignWithMargins = True
    Left = 57
    Top = 0
    Width = 293
    Height = 52
    Hint = ''
    Margins.Top = 0
    Margins.Bottom = 0
    CharCase = ecUpperCase
    Text = ''
    Align = alClient
    TabOrder = 1
    FieldLabel = ' Prazo - Separe os os prazos com / (barra)'
    FieldLabelAlign = laTop
    ExplicitLeft = 53
    ExplicitWidth = 297
  end
end
