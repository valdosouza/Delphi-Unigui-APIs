inherited PesCnpjOnLine: TPesCnpjOnLine
  ClientHeight = 219
  ClientWidth = 343
  Caption = 'Pesquisa CNPJ - On Line'
  ExplicitWidth = 359
  ExplicitHeight = 278
  PixelsPerInch = 96
  TextHeight = 13
  object UniImage1: TUniImage [0]
    Left = 0
    Top = 0
    Width = 343
    Height = 128
    Hint = ''
    Center = True
    Stretch = True
    Align = alTop
  end
  object LabAtualizarCaptcha: TUniLabel [1]
    Left = 0
    Top = 128
    Width = 343
    Height = 20
    Hint = ''
    Alignment = taCenter
    AutoSize = False
    Caption = 'Atualizar Captcha'
    Align = alTop
    ParentFont = False
    Font.Color = clBlue
    Font.Height = -16
    Font.Style = [fsBold, fsUnderline]
    TabOrder = 1
    OnClick = LabAtualizarCaptchaClick
  end
  object E_Captcha: TUniEdit [2]
    Left = 0
    Top = 168
    Width = 173
    Height = 41
    Hint = ''
    Text = ''
    ParentFont = False
    Font.Height = -27
    TabOrder = 2
  end
  object UniLabel2: TUniLabel [3]
    Left = 4
    Top = 152
    Width = 79
    Height = 13
    Hint = ''
    Caption = 'Digite o Captcha'
    TabOrder = 3
  end
  object Sb_Search: TUniSpeedButton [4]
    Left = 213
    Top = 154
    Width = 125
    Height = 58
    Hint = ''
    Caption = 'Consultar'
    ParentFont = False
    Font.Height = -16
    ParentColor = False
    Color = clWindow
    TabOrder = 4
    OnClick = Sb_SearchClick
  end
  object Cpn_Timer: TUniTimer
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = Cpn_TimerTimer
    Left = 178
    Top = 179
  end
end
