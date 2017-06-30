- dashboard: got_your_money
  title: Got Your Money
  layout: newspaper
  elements:
  - name: Credits
    title: Credits
    model: mint_andy
    explore: mint_andy
    type: table
    fields:
    - mint_data.total_amount
    - mint_data.category
    filters:
      mint_data.date_month: 6 months
      mint_data.transaction_type: credit
    sorts:
    - mint_data.total_amount desc
    limit: 500
    column_limit: 50
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Date: mint_andy.date_date
    row: 0
    col: 10
    width: 7
    height: 9
  - name: Debits
    title: Debits
    model: mint_andy
    explore: mint_andy
    type: table
    fields:
    - mint_data.total_amount
    - mint_data.category
    filters:
      mint_data.date_month: 6 months
      mint_data.transaction_type: debit
    sorts:
    - mint_data.total_amount
    limit: 500
    column_limit: 50
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Date: mint_andy.date_date
    row: 0
    col: 17
    width: 7
    height: 32
  - name: Monthly Spending
    title: Monthly Spending
    model: mint_andy
    explore: mint_andy
    type: looker_line
    fields:
    - mint_data.date_month
    - mint_data.credits
    - mint_data.debits
    fill_fields:
    - mint_data.date_month
    filters:
      mint_data.date_month: 6 months
    sorts:
    - mint_data.date_month
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: time
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    reference_lines: []
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: mint_andy.credits
        name: Mint Data Credits
      - id: mint_andy.debits
        name: Mint Data Debits
    focus_on_hover: false
    series_colors:
      mint_andy.credits: "#90d462"
      mint_andy.debits: "#9e6d75"
    listen:
      Date: mint_andy.date_date
    row: 0
    col: 0
    width: 10
    height: 7
  - name: Daily Averages
    title: Daily Averages
    model: mint_andy
    explore: mint_andy
    type: table
    fields:
    - mint_data.average_daily_amount
    - mint_data.transaction_type
    - calendar.count_of_days
    filters:
      calendar.date_date: 84 days
    sorts:
    - mint_data.average_daily_amount desc
    limit: 500
    column_limit: 50
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: time
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    series_types: {}
    reference_lines: []
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: mint_andy.credits
        name: Mint Data Credits
        __FILE: personal_finance/got_your_money.dashboard.lookml
        __LINE_NUM: 180
      - id: mint_andy.debits
        name: Mint Data Debits
        __FILE: personal_finance/got_your_money.dashboard.lookml
        __LINE_NUM: 182
      __FILE: personal_finance/got_your_money.dashboard.lookml
      __LINE_NUM: 168
    focus_on_hover: false
    series_colors:
      mint_andy.credits: "#90d462"
      mint_andy.debits: "#9e6d75"
    row: 7
    col: 0
    width: 10
    height: 4
  filters:
  - name: Date
    title: Date
    type: date_filter
    default_value: 6 months
    model:
    explore:
    field:
    listens_to_filters: []
    allow_multiple_values: true
