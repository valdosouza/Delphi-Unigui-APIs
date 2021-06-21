inherited PrintInvoice: TPrintInvoice
  ClientHeight = 179
  Caption = 'PrintInvoice'
  ExplicitHeight = 228
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_Botao: TUniPanel
    Top = 113
    ExplicitTop = 113
  end
  inherited pnl_Lista: TUniPanel
    Height = 113
    ExplicitHeight = 113
    inherited Lbx_reports: TUniListBox
      Height = 96
      Items.Strings = (
        'NOTA ELETR'#212'NICA 55')
      ExplicitHeight = 96
    end
  end
  inherited Parâmetros: TUniGroupBox
    Height = 113
    ExplicitHeight = 113
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
    object Ctn_Entity: TUniContainerPanel
      Left = 7
      Top = 60
      Width = 406
      Height = 39
      Hint = ''
      ParentColor = False
      TabOrder = 3
    end
    object UniLabel2: TUniLabel
      Left = 98
      Top = 16
      Width = 51
      Height = 13
      Hint = ''
      Caption = 'Data Final '
      TabOrder = 4
    end
    object Dtp_Final: TUniDateTimePicker
      Left = 98
      Top = 34
      Width = 89
      Hint = ''
      DateTime = 42979.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 5
    end
  end
end
