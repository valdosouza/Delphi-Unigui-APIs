inherited CadExtAgent: TCadExtAgent
  ClientHeight = 142
  ClientWidth = 567
  Caption = 'Cadastro Extintor Agente'
  ExplicitWidth = 583
  ExplicitHeight = 201
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 78
    Width = 567
    ExplicitTop = 67
    ExplicitWidth = 567
  end
  inherited pnl_fundo: TUniPanel
    Width = 567
    Height = 78
    ExplicitWidth = 567
    ExplicitHeight = 67
    object UniLabel1: TUniLabel
      Left = 6
      Top = 5
      Width = 33
      Height = 13
      Hint = ''
      Caption = 'C'#243'digo'
      TabOrder = 1
    end
    object E_Id: TUniEdit
      Left = 6
      Top = 20
      Width = 51
      Hint = ''
      Text = ''
      TabOrder = 2
    end
    object UniLabel2: TUniLabel
      Left = 59
      Top = 5
      Width = 85
      Height = 13
      Hint = ''
      Caption = 'Descri'#231#227'o Interna'
      TabOrder = 3
    end
    object E_Description: TUniEdit
      Left = 59
      Top = 20
      Width = 246
      Hint = ''
      Text = ''
      TabOrder = 4
    end
    object UniLabel3: TUniLabel
      Left = 307
      Top = 5
      Width = 31
      Height = 13
      Hint = ''
      Caption = 'Classe'
      TabOrder = 5
    end
    object E_Class: TUniEdit
      Left = 307
      Top = 20
      Width = 67
      Hint = ''
      Text = ''
      TabOrder = 6
    end
    object UniLabel4: TUniLabel
      Left = 376
      Top = 5
      Width = 88
      Height = 13
      Hint = ''
      Caption = 'Descri'#231#227'o INmetro'
      TabOrder = 7
    end
    object E_Dec_INmetro: TUniEdit
      Left = 376
      Top = 20
      Width = 186
      Hint = ''
      Text = ''
      TabOrder = 8
    end
    object chbx_cad_active: TUniCheckBox
      Left = 6
      Top = 45
      Width = 97
      Height = 17
      Hint = ''
      Caption = 'Cadastro Ativo'
      TabOrder = 9
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 456
    Top = 56
  end
end
