inherited BaseSearch1: TBaseSearch1
  Caption = 'SeaNfCtrl'
  ExplicitHeight = 584
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Top = 89
    Height = 383
    ExplicitWidth = 935
    inherited UniPageControl1: TUniPageControl
      Height = 379
      ExplicitLeft = 2
      ExplicitTop = 2
      ExplicitWidth = 931
      ExplicitHeight = 362
      inherited UniTabSheet1: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 923
        ExplicitHeight = 334
        inherited dbg_Search: TUniDBGrid
          Height = 351
          Columns = <>
        end
      end
    end
  end
  inherited Pnl_Parametros: TUniPanel
    Height = 89
    ExplicitLeft = 2
    ExplicitTop = -6
    ExplicitWidth = 935
    ExplicitHeight = 89
    object UniRadioGroup1: TUniRadioGroup
      Left = 3
      Top = 3
      Width = 198
      Height = 78
      Hint = ''
      Items.Strings = (
        'NF-e Pr'#243'pria '
        'NFC-e'
        'Nf-e Terceiro '
        'Nota Bloco A1')
      Caption = 'Modelos de Nota'
      TabOrder = 1
      Columns = 2
    end
    object UniRadioGroup2: TUniRadioGroup
      Left = 204
      Top = 3
      Width = 245
      Height = 78
      Hint = ''
      Items.Strings = (
        'Pendente'
        'Canceladas'
        'Denegada'
        'Autorizadas'
        'Inutilizada'
        'Todas')
      Caption = 'Situa'#231#227'o Nota Fiscal Eletr'#244'nica'
      TabOrder = 2
      Columns = 3
    end
    object UniLabel1: TUniLabel
      Left = 453
      Top = 9
      Width = 53
      Height = 13
      Hint = ''
      Caption = 'Data Inicial'
      TabOrder = 3
    end
    object UniDateTimePicker1: TUniDateTimePicker
      Left = 452
      Top = 24
      Width = 93
      Hint = ''
      DateTime = 43005.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 4
    end
    object UniLabel2: TUniLabel
      Left = 549
      Top = 9
      Width = 48
      Height = 13
      Hint = ''
      Caption = 'Data Final'
      TabOrder = 5
    end
    object UniDateTimePicker2: TUniDateTimePicker
      Left = 548
      Top = 24
      Width = 93
      Hint = ''
      DateTime = 43005.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 6
    end
  end
  inherited Pnl_Botoes: TUniPanel
    ExplicitWidth = 935
  end
end
