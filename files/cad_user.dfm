inherited CadUser: TCadUser
  ClientHeight = 443
  ClientWidth = 694
  Caption = 'Cadastro de Usu'#225'rios'
  ExplicitWidth = 710
  ExplicitHeight = 502
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 379
    Width = 694
    ExplicitTop = 351
    ExplicitWidth = 694
    inherited SB_Insert: TUniSpeedButton
      ExplicitLeft = 3
    end
    inherited SB_Change: TUniSpeedButton
      ExplicitTop = 5
    end
    inherited SB_Save: TUniSpeedButton
      ExplicitTop = 5
    end
    inherited Sb_Close: TUniSpeedButton
      ExplicitTop = 5
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 694
    Height = 379
    ExplicitTop = 0
    ExplicitWidth = 694
    ExplicitHeight = 351
    object chbx_cad_active: TUniCheckBox
      AlignWithMargins = True
      Left = 5
      Top = 161
      Width = 684
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Cadastro Ativo'
      Align = alTop
      TabOrder = 0
    end
    object pnl_row_1: TUniPanel
      Left = 2
      Top = 2
      Width = 690
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 2
      BorderStyle = ubsNone
      Caption = ''
      ExplicitLeft = 1
      ExplicitTop = -1
      object E_ID: TUniEdit
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 56
        Height = 46
        Hint = ''
        Text = ''
        Align = alLeft
        TabOrder = 1
        ReadOnly = True
        FieldLabel = 'C'#243'digo'
        FieldLabelAlign = laTop
      end
      object E_NameCompany: TUniEdit
        AlignWithMargins = True
        Left = 65
        Top = 3
        Width = 338
        Height = 46
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Align = alLeft
        TabOrder = 2
        FieldLabel = 'Nome Completo'
        FieldLabelAlign = laTop
      end
      object E_Apelido: TUniEdit
        AlignWithMargins = True
        Left = 409
        Top = 3
        Width = 278
        Height = 46
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Align = alClient
        TabOrder = 3
        FieldLabel = 'Como gosta de ser Chamado'
        FieldLabelAlign = laTop
      end
    end
    object pnl_row_2: TUniPanel
      Left = 2
      Top = 54
      Width = 690
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 3
      BorderStyle = ubsNone
      Caption = ''
      object E_email: TUniEdit
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 364
        Height = 46
        Hint = ''
        CharCase = ecLowerCase
        Text = ''
        ParentFont = False
        Align = alLeft
        TabOrder = 1
        FieldLabel = 'e-mail / Login'
        FieldLabelAlign = laTop
      end
      object e_senha_sistema: TUniEdit
        AlignWithMargins = True
        Left = 373
        Top = 3
        Width = 190
        Height = 46
        Hint = ''
        PasswordChar = '*'
        Text = ''
        Align = alLeft
        TabOrder = 2
        FieldLabel = 'Senha'
        FieldLabelAlign = laTop
      end
    end
    object pnl_row_3: TUniPanel
      Left = 2
      Top = 106
      Width = 690
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 4
      BorderStyle = ubsNone
      Caption = ''
      object Ctn_Device: TUniContainerPanel
        Left = 231
        Top = 0
        Width = 366
        Height = 52
        Hint = ''
        RTL = True
        ParentRTL = False
        ParentColor = False
        Align = alLeft
        TabOrder = 1
      end
      object Cb_Perfil: TUniComboBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 225
        Height = 46
        Hint = ''
        Style = csDropDownList
        Text = 'Administrador'
        Items.Strings = (
          'Administrador'
          'Supervisor'
          'Usu'#225'rio')
        ItemIndex = 0
        Align = alLeft
        TabOrder = 2
        FieldLabel = 'Tipo de Perfil'
        FieldLabelAlign = laTop
        IconItems = <>
      end
    end
    object UniPageControl1: TUniPageControl
      Left = 2
      Top = 184
      Width = 690
      Height = 193
      Hint = ''
      ActivePage = UniTabSheet1
      Align = alBottom
      TabOrder = 5
      ExplicitLeft = 1
      ExplicitTop = 183
      object UniTabSheet1: TUniTabSheet
        Hint = ''
        Caption = 'Confgura'#231#227'o de Envio de Email'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 690
        ExplicitHeight = 193
        object pnl_config_email: TUniPanel
          Left = 0
          Top = 0
          Width = 682
          Height = 165
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          ExplicitLeft = -1
          object pnl_config_email_row_1: TUniPanel
            Left = 2
            Top = 2
            Width = 678
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 1
            BorderStyle = ubsNone
            Caption = ''
            ExplicitLeft = 1
            ExplicitTop = -1
            object E_Porta: TUniEdit
              AlignWithMargins = True
              Left = 396
              Top = 3
              Width = 70
              Height = 46
              Hint = ''
              Text = ''
              ParentFont = False
              Align = alRight
              TabOrder = 1
              FieldLabel = 'Porta'
              FieldLabelAlign = laTop
              ExplicitLeft = 388
            end
            object E_Senha_Email: TUniEdit
              AlignWithMargins = True
              Left = 472
              Top = 3
              Width = 203
              Height = 46
              Hint = ''
              PasswordChar = '*'
              Text = ''
              ParentFont = False
              Align = alRight
              TabOrder = 2
              FieldLabel = 'Senha do email'
              FieldLabelAlign = laTop
            end
            object e_smtp: TUniEdit
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 387
              Height = 46
              Hint = ''
              Text = ''
              ParentFont = False
              Align = alClient
              TabOrder = 3
              FieldLabel = 'Servidor de sa'#237'da (SMTP);'
              FieldLabelAlign = laTop
              ExplicitWidth = 182
            end
          end
          object pnl_config_email_option: TUniPanel
            Left = 2
            Top = 54
            Width = 327
            Height = 109
            Hint = ''
            Align = alLeft
            TabOrder = 2
            BorderStyle = ubsNone
            Caption = ''
            DesignSize = (
              327
              109)
            object chbx_requer_autenticacao: TUniCheckBox
              AlignWithMargins = True
              Left = 1
              Top = 1
              Width = 325
              Height = 17
              Hint = ''
              Margins.Left = 1
              Margins.Top = 1
              Margins.Right = 1
              Margins.Bottom = 1
              Caption = 'Requer Autentica'#231#227'o'
              Align = alTop
              TabOrder = 1
              ExplicitLeft = 2
              ExplicitTop = 3
              ExplicitWidth = 388
            end
            object chbx_ssl: TUniCheckBox
              AlignWithMargins = True
              Left = 1
              Top = 20
              Width = 325
              Height = 17
              Hint = ''
              Margins.Left = 1
              Margins.Top = 1
              Margins.Right = 1
              Margins.Bottom = 1
              Caption = 'Requer uma conex'#227'o de seguran'#231'a (SSL)'
              Align = alTop
              TabOrder = 2
              ExplicitLeft = 6
              ExplicitTop = 11
              ExplicitWidth = 384
            end
            object chbx_notifica_acesso: TUniCheckBox
              AlignWithMargins = True
              Left = 1
              Top = 39
              Width = 325
              Height = 17
              Hint = ''
              Margins.Left = 1
              Margins.Top = 1
              Margins.Right = 1
              Margins.Bottom = 1
              Caption = 'Quero receber notifica'#231#227'o de tentativas ou login efetuado'
              Align = alTop
              TabOrder = 3
              ExplicitLeft = 6
              ExplicitTop = 11
              ExplicitWidth = 384
            end
            object sb_testar_email: TUniSpeedButton
              AlignWithMargins = True
              Left = -5
              Top = 72
              Width = 91
              Height = 34
              Hint = ''
              Margins.Right = 0
              Caption = 'Testar e-mail'
              Anchors = [akTop, akBottom]
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              ParentColor = False
              Color = clWindow
              IconAlign = iaTop
              TabOrder = 4
              OnClick = SB_InsertClick
              ExplicitLeft = 3
            end
          end
          object E_Assinatura: TUniMemo
            Left = 329
            Top = 54
            Width = 351
            Height = 109
            Hint = ''
            Lines.Strings = (
              'E_Assinatura')
            Align = alClient
            TabOrder = 3
            FieldLabel = 'Assinatura'
            FieldLabelAlign = laTop
            ExplicitLeft = 395
            ExplicitTop = 53
            ExplicitWidth = 288
          end
        end
      end
    end
  end
  inherited cds_msg: TClientDataSet
    Left = 344
    Top = 0
  end
  inherited ds_msg: TDataSource
    Left = 344
    Top = 48
  end
  inherited MenuTask: TUniMainMenu
    Left = 240
    Top = 16
    inherited MnuTarefas: TUniMenuItem
      object MnuPermissao: TUniMenuItem
        Caption = 'Permiss'#245'es'
        OnClick = MnuPermissaoClick
      end
    end
  end
end
