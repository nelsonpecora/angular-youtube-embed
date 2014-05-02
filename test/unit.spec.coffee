describe 'keats.youtube', ->
    rootScope = null
    el = null
    scope = null

    beforeEach module 'keats.youtube'
    beforeEach inject ($rootScope) ->
        rootScope = $rootScope

    beforeEach inject ($rootScope, $compile) ->
        scope = $rootScope.$new()

        el = angular.element '<youtube video="dQw4w9WgXcQ" class="youtube"></youtube>'

        $compile(el)(scope)
        scope.$digest()

    it 'should have correct video id', ->
        expect(el.attr('video')).toBe 'dQw4w9WgXcQ'

    it 'shold have background image', ->
        expect(el.css 'background-image'
                .match /\/\/img.youtube.com\/vi\/dQw4w9WgXcQ\/0.jpg/g
                .length)
            .toBe 1