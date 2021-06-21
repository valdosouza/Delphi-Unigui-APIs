inherited CadObservation: TCadObservation
  ClientHeight = 362
  ClientWidth = 568
  Caption = 'Cadastro de Observa'#231#227'o'
  ExplicitWidth = 584
  ExplicitHeight = 421
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 298
    Width = 568
    ExplicitTop = 287
    ExplicitWidth = 568
  end
  inherited pnl_fundo: TUniPanel
    Width = 568
    Height = 298
    ExplicitWidth = 568
    ExplicitHeight = 287
    object L_Codigo: TUniLabel
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
      TabOrder = 5
    end
    object E_ID: TUniEdit
      Left = 6
      Top = 21
      Width = 56
      Hint = ''
      Text = ''
      TabOrder = 0
      ReadOnly = True
    end
    object L_NameCompany: TUniLabel
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
      TabOrder = 6
    end
    object E_Description: TUniEdit
      Left = 65
      Top = 21
      Width = 497
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      TabOrder = 1
    end
    object M_Note: TUniMemo
      Left = 6
      Top = 49
      Width = 556
      Height = 176
      Hint = ''
      Lines.Strings = (
        'M_Note')
      TabOrder = 2
    end
    object cb_observation: TUniComboBox
      Left = 6
      Top = 258
      Width = 556
      Hint = ''
      Style = csDropDownList
      Text = '<<N'#227'o tem a'#231#227'o ativa no sistema>>'
      Items.Strings = (
        '<<N'#227'o tem a'#231#227'o ativa no sistema>>'
        
          'Nota Fiscal - Ser'#225' usada conforme determina'#231#227'o da regra de tribu' +
          'ta'#231#227'o'
        'Nota Fiscal - Regral Geral e vai ser impressa em todas as notas'
        'Pedido de Venda - Aviso importante para o Cliente'
        'Frente de Caixa ECF - Aviso importante para o consumidor')
      ItemIndex = 0
      TabOrder = 3
      IconItems = <>
    end
    object UniLabel1: TUniLabel
      Left = 6
      Top = 228
      Width = 347
      Height = 14
      Hint = ''
      Caption = 
        'Para informar valores Valiri'#225'veis, use caracteres coringas[ 1&v|' +
        ' 2&v|3&v|4&v]'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 7
    end
    object UniLabel2: TUniLabel
      Left = 6
      Top = 242
      Width = 98
      Height = 14
      Hint = ''
      Caption = 'Tipo de Observa'#231#227'o'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 8
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 496
    Top = 152
  end
end
