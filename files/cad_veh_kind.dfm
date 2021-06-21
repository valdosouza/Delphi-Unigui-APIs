inherited CadVehKind: TCadVehKind
  ClientHeight = 156
  ClientWidth = 571
  Caption = 'Cadastro Tipo de Pesquisa'
  ExplicitWidth = 587
  ExplicitHeight = 215
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 92
    Width = 571
    ExplicitTop = 92
    ExplicitWidth = 571
  end
  inherited pnl_fundo: TUniPanel
    Width = 571
    Height = 92
    ExplicitWidth = 571
    ExplicitHeight = 92
    object label1: TUniLabel
      Left = 6
      Top = 6
      Width = 33
      Height = 14
      Hint = ''
      Caption = 'C'#243'digo'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 1
    end
    object E_Codigo: TUniEdit
      Left = 6
      Top = 21
      Width = 56
      Hint = ''
      Text = ''
      TabOrder = 2
    end
    object label2: TUniLabel
      Left = 65
      Top = 6
      Width = 27
      Height = 14
      Hint = ''
      Caption = 'Nome'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 3
    end
    object E_Description: TUniEdit
      Left = 65
      Top = 21
      Width = 497
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      TabOrder = 4
    end
    object UniLabel1: TUniLabel
      Left = 6
      Top = 45
      Width = 45
      Height = 14
      Hint = ''
      Caption = 'Renavam'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 5
    end
    object E_renavam: TUniEdit
      Left = 6
      Top = 60
      Width = 56
      Hint = ''
      Text = ''
      TabOrder = 6
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 528
    Top = 65520
  end
end
