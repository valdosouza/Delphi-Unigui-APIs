inherited TasConfigNfe55: TTasConfigNfe55
  ClientHeight = 419
  ClientWidth = 496
  Caption = 'Nota Fiscal Eletr'#244'nica 55'
  Menu = nil
  LayoutConfig.IgnorePosition = False
  OnReady = UniFormReady
  ExplicitWidth = 512
  ExplicitHeight = 458
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 353
    Width = 496
    Height = 66
    LayoutConfig.IgnorePosition = False
    ExplicitTop = 353
    ExplicitWidth = 496
    ExplicitHeight = 66
    inherited SB_Insert: TUniSpeedButton
      Left = 470
      Height = 56
      Visible = False
      ExplicitLeft = 470
      ExplicitHeight = 56
    end
    inherited SB_Change: TUniSpeedButton
      Left = 2
      Height = 56
      ExplicitLeft = 2
      ExplicitHeight = 56
    end
    inherited SB_Delete: TUniSpeedButton
      Left = 374
      Height = 56
      Visible = False
      ExplicitLeft = 374
      ExplicitHeight = 56
    end
    inherited SB_Save: TUniSpeedButton
      Left = 93
      Height = 56
      ExplicitLeft = 93
      ExplicitHeight = 56
    end
    inherited SB_Cancel: TUniSpeedButton
      Left = 186
      Height = 56
      ExplicitLeft = 186
      ExplicitHeight = 56
    end
    inherited Sb_Close: TUniSpeedButton
      Left = 279
      Height = 56
      ExplicitLeft = 279
      ExplicitHeight = 56
    end
  end
  inherited pnl_fundo: TUniPanel
    Top = 25
    Width = 496
    Height = 328
    ExplicitTop = 25
    ExplicitWidth = 496
    ExplicitHeight = 328
    object Chbx_sendNfeToaccounting: TUniCheckBox
      Left = 141
      Top = 220
      Width = 340
      Height = 17
      Hint = ''
      Caption = 'Enviar Nota Nfe ao Contador'
      TabOrder = 1
    end
    object Chbx_sendNfeToyourSelf: TUniCheckBox
      Left = 141
      Top = 240
      Width = 340
      Height = 17
      Hint = ''
      Caption = 'Receber C'#243'pia Nfe no Email Principal'
      TabOrder = 2
    end
    object Rg_orientation: TUniRadioGroup
      Left = 137
      Top = 77
      Width = 175
      Height = 58
      Hint = ''
      Items.Strings = (
        'Retrato'
        'Paisagem')
      Caption = 'DANFE'
      TabOrder = 3
      Columns = 2
    end
    object UniGroupBox1: TUniGroupBox
      Left = 134
      Top = 136
      Width = 354
      Height = 58
      Hint = ''
      Caption = 'Cobran'#231'a'
      TabOrder = 4
      object Chbx_set_invoice: TUniCheckBox
        Left = 7
        Top = 12
        Width = 344
        Height = 17
        Hint = ''
        Caption = 'Utilizar Nota Fiscal Fatura'
        TabOrder = 1
      end
      object Chbx_set_duplicate: TUniCheckBox
        Left = 7
        Top = 35
        Width = 344
        Height = 17
        Hint = ''
        Caption = 'Utilizar Nota Fiscal Duplicata'
        TabOrder = 2
      end
    end
    object Rg_receipt_posit: TUniRadioGroup
      Left = 316
      Top = 77
      Width = 175
      Height = 58
      Hint = ''
      Items.Strings = (
        'Cabe'#231'alho'
        'Rodap'#233)
      Caption = 'Posi'#231#227'o Canhoto'
      TabOrder = 5
      Columns = 2
    end
    object Rg_Layer: TUniRadioGroup
      Left = 6
      Top = 5
      Width = 122
      Height = 84
      Hint = ''
      Items.Strings = (
        'Produ'#231#227'o'
        'Homologa'#231#227'o')
      Caption = 'Ambiente'
      TabOrder = 6
    end
    object Gb_Certificate: TUniGroupBox
      Left = 136
      Top = 5
      Width = 354
      Height = 68
      Hint = ''
      Caption = 'Dados do Certificado'
      TabOrder = 7
      object E_certificate_pass: TUniEdit
        Left = 9
        Top = 31
        Width = 208
        Hint = ''
        PasswordChar = '*'
        Text = ''
        TabOrder = 1
      end
      object UniLabel3: TUniLabel
        Left = 9
        Top = 16
        Width = 30
        Height = 13
        Hint = ''
        Caption = 'Senha'
        TabOrder = 2
      end
      object sb_Load_certificado: TUniButton
        Left = 223
        Top = 31
        Width = 121
        Height = 22
        Hint = ''
        Caption = 'Carregar Certificado'
        TabOrder = 3
        OnClick = sb_Load_certificadoClick
      end
    end
    object Rg_type_emission: TUniRadioGroup
      Left = 6
      Top = 91
      Width = 122
      Height = 249
      Hint = ''
      Items.Strings = (
        'Normal'
        'Conting'#234'ncia'
        'SCAN'
        'DPEC'
        'FDSA'
        'SVACAN'
        'SVC-RS'
        'SVC-SP')
      Caption = 'Emiss'#227'o'
      TabOrder = 8
    end
    object Chbx_set_view_msg: TUniCheckBox
      Left = 141
      Top = 200
      Width = 340
      Height = 17
      Hint = ''
      Caption = 'Visualizar Mensagem'
      TabOrder = 9
    end
    object UniLabel1: TUniLabel
      Left = 139
      Top = 263
      Width = 153
      Height = 13
      Hint = ''
      Caption = 'Vers'#227'o da Nota Fiscal Eletr'#244'nica'
      TabOrder = 10
    end
    object Cb_version: TUniComboBox
      Left = 137
      Top = 280
      Width = 155
      Hint = ''
      Text = 'Cb_version'
      Items.Strings = (
        'Vers'#227'o 3.10'
        'Vers'#227'o 4.00')
      TabOrder = 11
      IconItems = <>
    end
  end
  inherited pnl_topo: TUniPanel
    Width = 496
    Height = 25
    ExplicitWidth = 496
    ExplicitHeight = 25
    inherited Pnl_Cert_Expir: TUniPanel
      Width = 240
      Height = 25
      ExplicitWidth = 240
      ExplicitHeight = 25
    end
    inherited Pnl_Cert_Valid: TUniPanel
      Height = 25
      ExplicitHeight = 25
    end
  end
  inherited cds_msg: TClientDataSet
    Left = 64
  end
  inherited MenuTask: TUniMainMenu
    Left = 352
    Top = 256
    inherited MnuTarefas: TUniMenuItem
      object Sair1: TUniMenuItem
        Caption = 'Sair'
        OnClick = Sair1Click
      end
    end
  end
  inherited UniFileUpload: TUniFileUpload
    Left = 304
    Top = 232
  end
end
