inherited CadEntity: TCadEntity
  ClientHeight = 541
  ClientWidth = 674
  Caption = 'Cadastro de Entidades'
  ExplicitWidth = 690
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 477
    Width = 674
    TabOrder = 2
    ExplicitTop = 477
    ExplicitWidth = 674
  end
  inherited pnl_fundo: TUniPanel
    Width = 674
    Height = 209
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 674
    ExplicitHeight = 209
    object pnl_fundo_linha_1: TUniPanel
      Left = 2
      Top = 2
      Width = 670
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 1
      BorderStyle = ubsNone
      Caption = ''
      object E_DateRegistry: TUniDateTimePicker
        AlignWithMargins = True
        Left = 65
        Top = 3
        Width = 91
        Height = 41
        Hint = ''
        Margins.Bottom = 8
        DateTime = 42544.000000000000000000
        Align = alLeft
        TabOrder = 1
        FieldLabel = 'Data de Cadastro'
        FieldLabelAlign = laTop
        UseSystemFormats = True
      end
      object E_ID: TUniEdit
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 56
        Height = 41
        Hint = ''
        Margins.Bottom = 8
        Text = ''
        Align = alLeft
        TabOrder = 2
        ReadOnly = True
        FieldLabel = 'C'#243'digo'
        FieldLabelAlign = laTop
      end
    end
    object pnl_fundo_linha_2: TUniPanel
      Left = 2
      Top = 54
      Width = 670
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 2
      BorderStyle = ubsNone
      Caption = ''
      object E_NameCompany: TUniEdit
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 308
        Height = 46
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Align = alLeft
        TabOrder = 1
        FieldLabel = 'Nome/Raz'#227'o'
        FieldLabelAlign = laTop
      end
      object E_NickTrade: TUniEdit
        AlignWithMargins = True
        Left = 317
        Top = 3
        Width = 350
        Height = 46
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Align = alClient
        TabOrder = 2
        FieldLabel = 'Apelido/Fantasia'
        FieldLabelAlign = laTop
      end
    end
    object pnl_fundo_linha_3: TUniPanel
      Left = 2
      Top = 106
      Width = 670
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 3
      BorderStyle = ubsNone
      Caption = ''
      object Ctn_LineBusiness: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 554
        Height = 52
        Hint = ''
        ParentColor = False
        Align = alClient
        TabOrder = 1
      end
      object E_DtAniversary: TUniDateTimePicker
        AlignWithMargins = True
        Left = 557
        Top = 3
        Width = 110
        Height = 46
        Hint = ''
        DateTime = 43330.000000000000000000
        DateFormat = 'dd/mm/yyyy'
        TimeFormat = 'HH:mm:ss'
        Align = alRight
        TabOrder = 2
        FieldLabel = 'Data de Nascimento'
        FieldLabelAlign = laTop
      end
    end
    object pnl_fundo_linha_4: TUniPanel
      Left = 2
      Top = 158
      Width = 670
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 4
      BorderStyle = ubsNone
      Caption = ''
      object E_email: TUniEdit
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 308
        Height = 41
        Hint = ''
        Margins.Bottom = 8
        CharCase = ecLowerCase
        Text = ''
        ParentFont = False
        Align = alLeft
        TabOrder = 1
        FieldLabel = 'e-mail (Principal)'
        FieldLabelAlign = laTop
        OnChange = E_emailChange
      end
      object E_WebSite: TUniEdit
        AlignWithMargins = True
        Left = 317
        Top = 3
        Width = 350
        Height = 41
        Hint = ''
        Margins.Bottom = 8
        CharCase = ecLowerCase
        Text = ''
        ParentFont = False
        Align = alClient
        TabOrder = 2
        FieldLabel = 'Site na Web ( www )'
      end
    end
  end
  object Pg_Main: TUniPageControl [2]
    Left = 0
    Top = 209
    Width = 674
    Height = 268
    Hint = ''
    ActivePage = tb_Address
    Align = alClient
    TabOrder = 1
    object tb_Address: TUniTabSheet
      Hint = ''
      Caption = 'Endere'#231'o'
      object Ctn_Address: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 666
        Height = 240
        Hint = ''
        ParentColor = False
        Align = alClient
        TabOrder = 0
      end
    end
    object tb_Obs: TUniTabSheet
      Hint = ''
      Caption = 'Observa'#231#227'o'
      object E_Obs: TUniMemo
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 660
        Height = 234
        Hint = ''
        Align = alClient
        TabOrder = 0
      end
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 184
    inherited MnuTarefas: TUniMenuItem
      object MnuContatos: TUniMenuItem
        Caption = 'Contatos'
        OnClick = MnuContatosClick
      end
      object MnuTelefones: TUniMenuItem
        Caption = 'Telefones'
      end
      object MnuEnderecos: TUniMenuItem
        Caption = 'Endere'#231'os'
      end
    end
  end
end
