inherited PrintFinancialBills: TPrintFinancialBills
  ClientHeight = 174
  Caption = 'Relatorio de contas '#224' receber'
  ExplicitHeight = 223
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_Botao: TUniPanel
    Top = 108
    ExplicitTop = 108
  end
  inherited pnl_Lista: TUniPanel
    Height = 108
    ExplicitHeight = 108
    inherited Lbx_reports: TUniListBox
      Height = 91
      Items.Strings = (
        'CONTAS '#192' RECEBER')
      ExplicitHeight = 91
    end
  end
  inherited Parâmetros: TUniGroupBox
    Height = 108
    ExplicitHeight = 108
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
    object Ctn_Entity: TUniContainerPanel
      Left = 7
      Top = 60
      Width = 406
      Height = 39
      Hint = ''
      ParentColor = False
      TabOrder = 5
    end
  end
end
