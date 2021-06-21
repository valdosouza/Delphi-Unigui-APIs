object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 233
  ClientWidth = 363
  Caption = 'MainForm'
  BorderStyle = bsNone
  FormStyle = fsStayOnTop
  Position = poDefault
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object EditCNPJ: TUniEdit
    Left = 0
    Top = 185
    Width = 363
    Hint = ''
    Text = ''
    ParentFont = False
    Font.Height = -13
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 1
    ExplicitTop = -5
    ExplicitWidth = 347
  end
  object MM_dados: TUniMemo
    Left = 0
    Top = 207
    Width = 363
    Height = 26
    Hint = ''
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 215
    ExplicitWidth = 347
  end
  object pnl_geral: TUniPanel
    Left = 0
    Top = 0
    Width = 363
    Height = 185
    Hint = ''
    Align = alClient
    TabOrder = 0
    Caption = ''
    ExplicitWidth = 347
    ExplicitHeight = 201
    object Image1: TUniImage
      Left = 1
      Top = 1
      Width = 361
      Height = 106
      Hint = ''
      Center = True
      Stretch = True
      Align = alTop
      ExplicitTop = -5
      ExplicitWidth = 345
    end
    object LabAtualizarCaptcha: TUniLabel
      Left = 1
      Top = 107
      Width = 361
      Height = 11
      Hint = ''
      Alignment = taCenter
      AutoSize = False
      Caption = 'Atualizar Captcha'
      Align = alClient
      ParentFont = False
      Font.Height = -16
      TabOrder = 2
      OnClick = LabAtualizarCaptchaClick
      ExplicitLeft = 2
      ExplicitTop = 105
      ExplicitWidth = 345
      ExplicitHeight = 27
    end
    object pnl_Botton: TUniPanel
      Left = 1
      Top = 118
      Width = 361
      Height = 66
      Hint = ''
      Align = alBottom
      TabOrder = 3
      BorderStyle = ubsFrameRaised
      Caption = ''
      ExplicitTop = 61
      ExplicitWidth = 345
      object pnl_botton_client: TUniPanel
        Left = 2
        Top = 2
        Width = 234
        Height = 62
        Hint = ''
        Align = alClient
        TabOrder = 1
        BorderStyle = ubsNone
        Caption = 'pnl_botton_client'
        ExplicitLeft = -2
        ExplicitTop = -5
        ExplicitWidth = 222
        ExplicitHeight = 66
        object UniLabel1: TUniLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 93
          Height = 16
          Hint = ''
          Margins.Bottom = 0
          Caption = 'Digite o Captcha'
          Align = alTop
          ParentFont = False
          Font.Height = -13
          TabOrder = 1
          ExplicitLeft = 4
          ExplicitTop = 4
        end
        object EditCaptcha: TUniEdit
          AlignWithMargins = True
          Left = 3
          Top = 19
          Width = 228
          Height = 40
          Hint = ''
          Margins.Top = 0
          Alignment = taCenter
          Text = ''
          ParentFont = False
          Font.Height = -27
          Align = alClient
          TabOrder = 2
          ExplicitLeft = 4
          ExplicitTop = 20
          ExplicitWidth = 216
          ExplicitHeight = 42
        end
      end
      object pnl_botton_right: TUniPanel
        Left = 236
        Top = 2
        Width = 123
        Height = 62
        Hint = ''
        Align = alRight
        TabOrder = 2
        BorderStyle = ubsNone
        Caption = 'pnl_botton_right'
        ExplicitLeft = 224
        ExplicitTop = 0
        ExplicitHeight = 66
        object ButBuscar: TUniBitBtn
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 115
          Height = 54
          Hint = ''
          Glyph.Data = {
            E6040000424DE604000000000000360000002800000014000000140000000100
            180000000000B0040000120B0000120B00000000000000000000FFFFFFFDFDFD
            C1C1C1A7A7A7F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D4D6C8C6C89F
            9F9FAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEBECD4CBCEC9C7C89595
            95CCCCCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAE7E8D4CCCFBAB9B98D8D8D
            EDEDEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDCDDD3CBCEAEAEAE949494FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D0D2CDC7C99A9A9AB4B4B4FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2CCCEC6C0C2868686E3E3E3FFFFFF
            FBFBFBEDEDEDECECECF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFED7CFD1B6B3B3808081A2A2A2949496A3
            A3A49E9EA089898AABABABF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9B8B9B7B7B9E4E3E4FCFCFDFFFFFFFFFF
            FFFAFAFAD2D2D2838384E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF1F1F1ADADAFF3F3F3F9F9F9F8F8F8FAFAFAFAFAFAFAFAFA
            FBFBFBECECEC878788F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFAFAFB1ECEBEBF3F3F3F4F4F4F6F6F6F6F6F6F7F7F7F6F6F6F6F6F6F8
            F8F8D8D8D9AAAAAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8
            BAB9BBF0F0F0EFEFEFF4F4F4F4F4F4F4F4F4F5F5F5F4F4F4F5F5F5F4F4F4F6F6
            F6929293DFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEBC8C7C8ED
            EDEDEFEFEFF3F3F3F2F2F2F2F2F2F3F3F3F3F3F3F3F3F3F4F4F4F7F7F7B1B1B2
            C0C0C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9BFBEBEEAEAEAEDED
            EDF0F0F0F1F1F1F1F1F1F2F2F2F2F2F2F2F2F2F2F2F2F4F4F4B5B5B7C2C2C3FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F3ADACACE4E5E4E7E7E7E8E8E8
            E8E8E8E8E8E8EAEAEAEAEAEAECECECEEEEEEF2F2F2AFAFB0DBDBDCFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB1B0B0CACACAF1F1F1EEEEEEEDEDEDEB
            EBEBECECECEEEEEEEFEFEFF2F2F2EBEAEBB1B1B2FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFE7E7E7969695DFDFDFF2F3F3EEEEEEEDEDEDEFEF
            EFEFEFEFF2F2F2F0F0F0B2B2B4F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFD6D6D69C9B9BCFCFCFE8E8E8EEEEEEF0F0F0ECECEC
            DDDDDDB3B3B4D6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFE9E9E9B0B0AFA4A3A3ACACABB0B0AFB0AFAFAEAEAFE5
            E5E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFAFAFAE6E6E6D9D8D8DADADAE4E3E4FCFCFCFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF}
          Caption = 'Consultar'
          Align = alClient
          ParentFont = False
          Font.Height = -16
          TabOrder = 1
          OnClick = ButBuscarClick
          ExplicitHeight = 58
        end
      end
    end
  end
  object LcCNPJ: TACBrConsultaCNPJ
    ProxyPort = '8080'
    PesquisarIBGE = False
    Left = 152
    Top = 42
  end
  object Timer1: TUniTimer
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = Timer1Timer
    Left = 248
    Top = 16
  end
end
