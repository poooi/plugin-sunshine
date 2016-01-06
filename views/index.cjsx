{React, ReactDOM, ReactBootstrap, $, ROOT, APPDATA_PATH} = window
{Tabs, Tab, Grid, Row, Col, Input} = ReactBootstrap

HeadquartersInfo = require './headquartersInfo'

SunshineArea = React.createClass
  getInitialState: ->
    selectedKey: 0
    selectedType: "lv"
  handleSelectTab: (selectedKey)->
    @setState
      selectedKey: selectedKey
  handleTypeChange: ()->
    @setState
      selectedType: @refs.type.getValue()
  render: ->
    <div>
      <Tabs activeKey={@state.selectedKey} animation={false} onSelect={@handleSelectTab}>
        <Tab eventKey={0} title='提督司令部' >
          <HeadquartersInfo />
        </Tab>
        <Tab eventKey={1} title='相关图表' >
          <Grid>
            <Row className='vertical-center'>
              <Col xs={2} className='text-center'>
                类别
              </Col>
              <Col xs={6}>
                <Input type='select' ref="type" placeholder='lv' onChange={@handleTypeChange}>
                  <option value='lv'>等级分布</option>
                  <option value='type'>舰种</option>
                  <option value='name'>舰名</option>
                  <option value='lv'>等级</option>
                  <option value='cond'>状态</option>
                  <option value='karyoku'>火力</option>
                  <option value='raisou'>雷装</option>
                  <option value='taiku'>对空</option>
                  <option value='soukou'>装甲</option>
                  <option value='lucky'>幸运</option>
                  <option value='sakuteki'>索敌</option>
                </Input>
              </Col>
            </Row>
          </Grid>
        </Tab>
      </Tabs>
    </div>

ReactDOM.render <SunshineArea />, $('sunshine')
