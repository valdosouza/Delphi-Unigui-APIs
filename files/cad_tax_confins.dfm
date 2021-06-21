inherited CadTaxConfins: TCadTaxConfins
  ClientHeight = 117
  ClientWidth = 678
  Caption = 'CadTaxConfins'
  ExplicitWidth = 694
  ExplicitHeight = 176
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniSimplePanel
    Top = 53
    Width = 678
  end
  inherited pnl_fundo: TUniSimplePanel
    Width = 678
    Height = 53
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
      TabOrder = 1
    end
    object L_Taxa: TUniLabel
      Left = 62
      Top = 7
      Width = 56
      Height = 13
      Hint = ''
      Caption = 'Grupo Taxa'
      TabOrder = 2
    end
    object L_NameCompany: TUniLabel
      Left = 171
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
      Left = 171
      Top = 21
      Width = 500
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      TabOrder = 4
    end
    object UniSimplePanel1: TUniSimplePanel
      Left = 0
      Top = 0
      Width = 678
      Height = 53
      Hint = ''
      ParentColor = False
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 5
      ExplicitLeft = -3
      ExplicitTop = -2
      ExplicitWidth = 722
      ExplicitHeight = 422
      object UniLabel1: TUniLabel
        Left = 62
        Top = 7
        Width = 56
        Height = 13
        Hint = ''
        Caption = 'Grupo Taxa'
        TabOrder = 1
      end
      object UniLabel2: TUniLabel
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
        TabOrder = 2
      end
      object UniEdit1: TUniEdit
        Left = 171
        Top = 21
        Width = 500
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        TabOrder = 3
      end
      object UniLabel3: TUniLabel
        Left = 171
        Top = 6
        Width = 27
        Height = 14
        Hint = ''
        Caption = 'Nome'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        TabOrder = 4
      end
    end
    object E_ID: TUniEdit
      Left = 7
      Top = 21
      Width = 53
      Hint = ''
      Text = ''
      TabOrder = 6
      ReadOnly = True
    end
    object E_Tax_Group: TUniEdit
      Left = 62
      Top = 21
      Width = 107
      Hint = ''
      CharCase = ecUpperCase
      Alignment = taRightJustify
      Text = ''
      ParentFont = False
      TabOrder = 7
    end
  end
  inherited Menu: TUniMainMenu
    Top = 64
  end
end
