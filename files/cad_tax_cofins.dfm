inherited CadTaxCofins: TCadTaxCofins
  ClientHeight = 127
  ClientWidth = 569
  Caption = 'Cadastro Situa'#231#227'o Tributaria Cofins'
  ExplicitWidth = 585
  ExplicitHeight = 186
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 63
    Width = 569
    ExplicitTop = 53
    ExplicitWidth = 569
    inherited SB_Save: TUniSpeedButton
      ExplicitTop = 5
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 569
    Height = 63
    ExplicitWidth = 569
    ExplicitHeight = 53
    object UniSimplePanel2: TUniSimplePanel
      Left = 2
      Top = 2
      Width = 565
      Height = 59
      Hint = ''
      ParentColor = False
      Align = alClient
      TabOrder = 1
      ExplicitHeight = 49
      object L_Codigo: TUniLabel
        Left = 7
        Top = 4
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
        Left = 7
        Top = 19
        Width = 71
        Hint = ''
        Text = ''
        TabOrder = 2
      end
      object L_NameCompany: TUniLabel
        Left = 81
        Top = 4
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
        Left = 81
        Top = 19
        Width = 481
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        TabOrder = 4
      end
    end
  end
  inherited MenuTask: TUniMainMenu
    Top = 64
  end
end
