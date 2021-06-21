inherited CadExtKind: TCadExtKind
  ClientHeight = 375
  ClientWidth = 576
  Caption = 'Cadastro Tipo de Extintor'
  ExplicitWidth = 592
  ExplicitHeight = 434
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 311
    Width = 576
    ExplicitTop = 311
    ExplicitWidth = 576
  end
  inherited pnl_fundo: TUniPanel
    Width = 576
    Height = 311
    ExplicitWidth = 576
    ExplicitHeight = 311
    object Ctn_Ext_Agent: TUniContainerPanel
      Left = 5
      Top = 8
      Width = 557
      Height = 38
      Hint = ''
      ParentColor = False
      TabOrder = 1
    end
    object UniLabel1: TUniLabel
      Left = 5
      Top = 49
      Width = 69
      Height = 13
      Hint = ''
      Caption = 'Carga Nominal'
      TabOrder = 2
    end
    object E_capacity: TUniEdit
      Left = 5
      Top = 64
      Width = 84
      Hint = ''
      Text = ''
      TabOrder = 3
    end
    object Ctn_Measure: TUniContainerPanel
      Left = 92
      Top = 51
      Width = 256
      Height = 38
      Hint = ''
      ParentColor = False
      TabOrder = 4
    end
    object UniGroupBox1: TUniGroupBox
      Left = 3
      Top = 95
      Width = 500
      Height = 60
      Hint = ''
      Caption = 'Validade das manuten'#231#245'es em meses'
      TabOrder = 5
      object E_days_to_inspection: TUniEdit
        Left = 4
        Top = 30
        Width = 91
        Hint = ''
        Text = ''
        TabOrder = 1
      end
      object UniLabel2: TUniLabel
        Left = 4
        Top = 15
        Width = 44
        Height = 13
        Hint = ''
        Caption = 'Inspe'#231#227'o'
        TabOrder = 2
      end
      object UniLabel3: TUniLabel
        Left = 101
        Top = 16
        Width = 94
        Height = 13
        Hint = ''
        Caption = 'Manuten'#231#227'o N'#237'vel 2'
        TabOrder = 3
      end
      object E_days_to_level_2: TUniEdit
        Left = 97
        Top = 30
        Width = 121
        Hint = ''
        Text = ''
        TabOrder = 4
      end
      object E_days_to_level_3: TUniEdit
        Left = 220
        Top = 30
        Width = 121
        Hint = ''
        Text = ''
        TabOrder = 5
      end
      object UniLabel4: TUniLabel
        Left = 220
        Top = 15
        Width = 94
        Height = 13
        Hint = ''
        Caption = 'Manuten'#231#227'o N'#237'vel 3'
        TabOrder = 6
      end
      object E_day_to_exp_charge: TUniEdit
        Left = 343
        Top = 30
        Width = 132
        Hint = ''
        Text = ''
        TabOrder = 7
      end
      object UniLabel5: TUniLabel
        Left = 343
        Top = 15
        Width = 130
        Height = 13
        Hint = ''
        Caption = 'Carga M'#225'xima Manuten'#231#227'o'
        TabOrder = 8
      end
    end
    object UniGroupBox2: TUniGroupBox
      Left = 5
      Top = 155
      Width = 557
      Height = 105
      Hint = ''
      Caption = 'Toler'#226'ncias %'
      TabOrder = 6
      object UniLabel6: TUniLabel
        Left = 4
        Top = 17
        Width = 111
        Height = 13
        Hint = ''
        Caption = 'Carga M'#237'nima Inspe'#231#227'o'
        TabOrder = 1
      end
      object E_tol_insp_charge_min: TUniEdit
        Left = 4
        Top = 32
        Width = 132
        Hint = ''
        Text = ''
        TabOrder = 2
      end
      object UniLabel7: TUniLabel
        Left = 138
        Top = 17
        Width = 115
        Height = 13
        Hint = ''
        Caption = 'Carga M'#225'xima Inspe'#231#227'o'
        TabOrder = 3
      end
      object E_tol_insp_charge_max: TUniEdit
        Left = 138
        Top = 32
        Width = 132
        Hint = ''
        Text = ''
        TabOrder = 4
      end
      object UniLabel8: TUniLabel
        Left = 272
        Top = 17
        Width = 126
        Height = 13
        Hint = ''
        Caption = 'Carga M'#237'nima Manuten'#231#227'o'
        TabOrder = 5
      end
      object E_tol_main_charge_min: TUniEdit
        Left = 272
        Top = 32
        Width = 137
        Hint = ''
        Text = ''
        TabOrder = 6
      end
      object UniLabel9: TUniLabel
        Left = 411
        Top = 17
        Width = 130
        Height = 13
        Hint = ''
        Caption = 'Carga M'#225'xima Manuten'#231#227'o'
        TabOrder = 7
      end
      object E_tol_main_charge_max: TUniEdit
        Left = 411
        Top = 32
        Width = 137
        Hint = ''
        Text = ''
        TabOrder = 8
      end
      object UniLabel10: TUniLabel
        Left = 6
        Top = 57
        Width = 96
        Height = 13
        Hint = ''
        Caption = 'Perda Massa M'#237'nima'
        TabOrder = 9
      end
      object E_tol_weight_loss: TUniEdit
        Left = 4
        Top = 72
        Width = 111
        Hint = ''
        Text = ''
        TabOrder = 10
      end
      object UniLabel11: TUniLabel
        Left = 119
        Top = 57
        Width = 83
        Height = 13
        Hint = ''
        Caption = 'Volume Hidr'#225'ulico'
        TabOrder = 11
      end
      object E_tol_hydraulic_volume: TUniEdit
        Left = 117
        Top = 72
        Width = 111
        Hint = ''
        Text = ''
        TabOrder = 12
      end
      object UniLabel12: TUniLabel
        Left = 232
        Top = 57
        Width = 108
        Height = 13
        Hint = ''
        Caption = 'Expans'#227'o Permanente'
        TabOrder = 13
      end
      object E_tol_permanent_expansion: TUniEdit
        Left = 230
        Top = 72
        Width = 123
        Hint = ''
        Text = ''
        TabOrder = 14
      end
    end
    object UniLabel13: TUniLabel
      Left = 5
      Top = 264
      Width = 161
      Height = 13
      Hint = ''
      Caption = 'Tempo de descarga em Segundos'
      TabOrder = 7
    end
    object E_discharge_time: TUniEdit
      Left = 5
      Top = 279
      Width = 172
      Hint = ''
      Text = ''
      TabOrder = 8
    end
    object UniLabel14: TUniLabel
      Left = 183
      Top = 264
      Width = 127
      Height = 13
      Hint = ''
      Caption = 'Alcance do jato em metros'
      TabOrder = 9
    end
    object E_jet_range: TUniEdit
      Left = 179
      Top = 279
      Width = 144
      Hint = ''
      Text = ''
      TabOrder = 10
    end
    object E_load_yield: TUniEdit
      Left = 325
      Top = 279
      Width = 144
      Hint = ''
      Text = ''
      TabOrder = 11
    end
    object UniLabel15: TUniLabel
      Left = 329
      Top = 264
      Width = 120
      Height = 13
      Hint = ''
      Caption = 'Redimento da Carga (%)'
      TabOrder = 12
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 384
    Top = 216
  end
end
