var app = angular.module("tourismApp", []);

app.controller("TourismController", function ($scope, $http) {
    // Fetch JSON Data
    $http.get("http://localhost:3000/tours").then(function (response) {
        $scope.places = response.data;
    });

    // Book a Tour
    $scope.bookTour = function (place) {
        $http.post("http://localhost:3000/book", { id: place.id }).then(function (response) {
            $scope.bookingMessage = response.data.message;
            place.available = false; // Update UI
        }, function (error) {
            $scope.bookingMessage = error.data.error;
        });
    };
});
