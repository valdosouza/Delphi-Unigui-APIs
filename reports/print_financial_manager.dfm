inherited PrintFinancialManager: TPrintFinancialManager
  ClientHeight = 193
  Caption = 'Relat'#243'rio Gerencial'
  ExplicitHeight = 242
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_Botao: TUniPanel
    Top = 127
    ExplicitTop = 127
  end
  inherited pnl_Lista: TUniPanel
    Height = 127
    ExplicitHeight = 127
    inherited Lbx_reports: TUniListBox
      Height = 110
      Items.Strings = (
        'Plano de Contas - Realizado')
      ExplicitHeight = 110
    end
  end
  inherited Parâmetros: TUniGroupBox
    Height = 127
    ExplicitHeight = 127
    object ChBx_Periodo: TUniCheckBox
      Left = 7
      Top = 16
      Width = 85
      Height = 17
      Hint = ''
      Caption = 'Data Inicial'
      TabOrder = 1
    end
    object Dtp_Inicial: TUniDateTimePicker
      Left = 7
      Top = 34
      Width = 89
      Hint = ''
      DateTime = 42979.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 2
    end
    object UniLabel2: TUniLabel
      Left = 98
      Top = 16
      Width = 51
      Height = 13
      Hint = ''
      Caption = 'Data Final '
      TabOrder = 3
    end
    object Dtp_Final: TUniDateTimePicker
      Left = 98
      Top = 34
      Width = 89
      Hint = ''
      DateTime = 42979.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 4
    end
    object E_Terminal: TUniEdit
      Left = 6
      Top = 72
      Width = 53
      Hint = ''
      Text = ''
      TabOrder = 5
    end
    object L_Codigo: TUniLabel
      Left = 8
      Top = 57
      Width = 39
      Height = 14
      Hint = ''
      Caption = 'Terminal'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 6
    end
  end
end
