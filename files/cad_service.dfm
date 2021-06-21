inherited CadService: TCadService
  ClientHeight = 416
  ClientWidth = 570
  Caption = 'Cadastro de Servi'#231'o'
  ExplicitWidth = 586
  ExplicitHeight = 475
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 352
    Width = 570
    ExplicitTop = 352
    ExplicitWidth = 570
  end
  inherited pnl_fundo: TUniPanel
    Width = 570
    Height = 352
    ExplicitWidth = 570
    ExplicitHeight = 352
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
      Width = 49
      Height = 14
      Hint = ''
      Caption = 'Descri'#231#227'o'
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
    object ctn_Category: TUniContainerPanel
      Left = 6
      Top = 49
      Width = 556
      Height = 36
      Hint = ''
      ParentColor = False
      TabOrder = 5
    end
    object UniLabel1: TUniLabel
      Left = 6
      Top = 87
      Width = 71
      Height = 14
      Hint = ''
      Caption = 'Al'#237'q. Comiss'#227'o'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 6
    end
    object E_Aliq_comissao: TUniEdit
      Left = 6
      Top = 102
      Width = 79
      Hint = ''
      CharEOL = #13
      Text = ''
      TabOrder = 7
    end
    object UniLabel3: TUniLabel
      Left = 88
      Top = 87
      Width = 80
      Height = 14
      Hint = ''
      Caption = 'Margem de lucro'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 8
    end
    object E_Margem_lucro: TUniEdit
      Left = 88
      Top = 102
      Width = 89
      Hint = ''
      CharEOL = #13
      Text = ''
      TabOrder = 9
    end
    object E_preço_venda: TUniEdit
      Left = 180
      Top = 102
      Width = 89
      Hint = ''
      CharEOL = #13
      Text = ''
      TabOrder = 10
    end
    object UniLabel4: TUniLabel
      Left = 180
      Top = 87
      Width = 77
      Height = 14
      Hint = ''
      Caption = 'Pre'#231'o de Venda'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 11
    end
    object M_memo: TUniMemo
      Left = 6
      Top = 142
      Width = 556
      Height = 185
      Hint = ''
      Lines.Strings = (
        'M_memo')
      TabOrder = 12
    end
    object UniLabel5: TUniLabel
      Left = 6
      Top = 127
      Width = 60
      Height = 14
      Hint = ''
      Caption = 'Observa'#231#227'o'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 13
    end
    object Chbx_active: TUniCheckBox
      Left = 6
      Top = 329
      Width = 293
      Height = 17
      Hint = ''
      Caption = 'Este Servi'#231'o encontra-se Ativo para qualquer Transi'#231#227'o'
      TabOrder = 14
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 504
    Top = 272
  end
end
