inherited CadBankChargeKind: TCadBankChargeKind
  ClientHeight = 123
  ClientWidth = 570
  Caption = 'Cadastro de Esp'#233'cie de Documento'
  ExplicitWidth = 586
  ExplicitHeight = 182
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 59
    Width = 570
    ExplicitTop = 121
    ExplicitWidth = 570
    inherited SB_Change: TUniSpeedButton
      ExplicitTop = 5
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 570
    Height = 59
    ExplicitWidth = 570
    ExplicitHeight = 121
    object pnl_row_2: TUniPanel
      Left = 2
      Top = 54
      Width = 566
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 1
      BorderStyle = ubsNone
      Caption = ''
    end
    object pnl_row_1: TUniPanel
      Left = 2
      Top = 2
      Width = 566
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 2
      BorderStyle = ubsNone
      Caption = ''
      object E_Id: TUniEdit
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 61
        Height = 44
        Hint = ''
        Text = ''
        Align = alLeft
        TabOrder = 1
        FieldLabel = 'C'#243'digo'
        FieldLabelAlign = laTop
      end
      object E_Abbreviation: TUniEdit
        AlignWithMargins = True
        Left = 71
        Top = 4
        Width = 62
        Height = 44
        Hint = ''
        Text = ''
        Align = alLeft
        TabOrder = 2
        FieldLabel = 'Sigla'
        FieldLabelAlign = laTop
      end
      object E_Description: TUniEdit
        AlignWithMargins = True
        Left = 139
        Top = 4
        Width = 423
        Height = 44
        Hint = ''
        Text = ''
        Align = alClient
        TabOrder = 3
        FieldLabel = 'Descri'#231#227'o'
        FieldLabelAlign = laTop
      end
    end
  end
  inherited cds_msg: TClientDataSet
    Left = 376
  end
  inherited ds_msg: TDataSource
    Left = 360
  end
  inherited MenuTask: TUniMainMenu
    Top = 144
  end
end
