inherited CadBank: TCadBank
  ClientHeight = 148
  ClientWidth = 572
  Caption = 'Cadastro Banco'
  ExplicitWidth = 588
  ExplicitHeight = 207
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 84
    Width = 572
    ExplicitTop = 80
    ExplicitWidth = 572
  end
  inherited pnl_fundo: TUniPanel
    Width = 572
    Height = 84
    ExplicitTop = -1
    ExplicitWidth = 572
    ExplicitHeight = 95
    object pnl_row_2: TUniPanel
      Left = 2
      Top = 54
      Width = 568
      Height = 29
      Hint = ''
      Align = alTop
      TabOrder = 1
      BorderStyle = ubsNone
      Caption = ''
      object chbx_cad_active: TUniCheckBox
        Left = 2
        Top = 2
        Width = 136
        Height = 25
        Hint = ''
        Checked = True
        Caption = 'Cadastro Ativo'
        Align = alLeft
        TabOrder = 1
        ExplicitLeft = 49
        ExplicitTop = 63
        ExplicitHeight = 17
      end
    end
    object pnl_row_1: TUniPanel
      Left = 2
      Top = 2
      Width = 568
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 2
      BorderStyle = ubsNone
      Caption = ''
      ExplicitLeft = 8
      ExplicitTop = 88
      ExplicitWidth = 556
      object E_Id: TUniEdit
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 49
        Height = 44
        Hint = ''
        Text = ''
        Align = alLeft
        TabOrder = 1
        FieldLabel = 'C'#243'digo'
        FieldLabelAlign = laTop
      end
      object E_Number: TUniEdit
        AlignWithMargins = True
        Left = 59
        Top = 4
        Width = 53
        Height = 44
        Hint = ''
        Text = ''
        Align = alLeft
        TabOrder = 2
        FieldLabel = 'N'#250'mero'
        FieldLabelAlign = laTop
      end
      object E_Name_Company: TUniEdit
        AlignWithMargins = True
        Left = 118
        Top = 4
        Width = 446
        Height = 44
        Hint = ''
        Text = ''
        Align = alClient
        TabOrder = 3
        FieldLabel = 'Nome'
        FieldLabelAlign = laTop
        ExplicitWidth = 434
      end
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 576
    Top = 128
  end
end
